namespace LibraryOne.Posting;

using LibraryOne.Books;
using LibraryOne.Setup;
using LibraryOne.Posting;

table 50107 "Book Journal Line"
{
    Caption = 'Book Journal Line';
    DataClassification = ToBeClassified;
    DrillDownPageID = "Book Journal Lines";
    LookupPageID = "Book Journal Lines";

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Book Journal Template";
        }
        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Book Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
            ValidateTableRelation = true;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Book Code"; Code[20])
        {
            Caption = 'Book Code';
            TableRelation = if ("Entry Type" = const("Book Ledger Entry Type"::Loan)) Book where(Availability = filter(> 0))
            else
            if ("Entry Type" = const("Book Ledger Entry Type"::Return)) Book where("On Loan" = filter(> 0))
            else
            if ("Entry Type" = const("Book Ledger Entry Type"::Sales)) Book where(Availability = filter(> 0))
            else
            if ("Entry Type" = const("Book Ledger Entry Type"::Purchase)) Book;
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';

            trigger OnValidate()
            var
                LibraryOneSetup: Record "Library One Setup";
            begin
                LibraryOneSetup.Get();
                LibraryOneSetup.TestField("Due Days");

                if "Entry Type" = "Entry Type"::Loan then
                    "Due Date" := CalcDate(LibraryOneSetup."Due Days", "Posting Date")
                else
                    "Due Date" := 0D;
            end;
        }
        field(6; "Entry Type"; Enum "Book Ledger Entry Type")
        {
            Caption = 'Entry Type';
        }
        field(7; "Book Reader Code"; Code[20])
        {
            Caption = 'Book Reader Code';
            TableRelation = if ("Entry Type" = filter("Book Ledger Entry Type"::Loan | "Book Ledger Entry Type"::Sales)) "Book Reader"
            else
            if ("Entry Type" = const("Book Ledger Entry Type"::Return)) "Book Reader" where("On Loan" = filter(> 0));
        }
        field(8; Quantity; Integer)
        {
            Caption = 'Quantity';
        }
        field(9; "Due Date"; Date)
        {
            Caption = 'Due Date';

            trigger OnValidate()
            var
                WrongDueDateErr: Label '%1 cannot be earlier than %2', Comment = '%1 = Due Date; %2 = Posting Date';
            begin
                if "Due Date" < "Posting Date" then
                    Error(WrongDueDateErr, Rec.FieldCaption("Due Date"), Rec.FieldCaption("Posting Date"));
            end;
        }
        field(10; "Book Title"; Text[100])
        {
            Caption = 'Book Title';
            FieldClass = FlowField;
            CalcFormula = lookup(Book.Title where(Code = field("Book Code")));
            Editable = false;
        }
        field(11; "Book Reader Full Name"; Text[101])
        {
            Caption = 'Book Reader Full Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Book Reader"."Full Name" where(Code = field("Book Reader Code")));
            Editable = false;
        }
        field(12; "Loan Entry No."; Integer)
        {
            Caption = 'Loan Entry No.';
            TableRelation = "Book Loan Entry" where("Entry Type" = const(Loan),
                                                     "Book Code" = field("Book Code"),
                                                     "Book Reader Code" = field("Book Reader Code"),
                                                     Returned = const(false));
            ValidateTableRelation = true;

            trigger OnValidate()
            var
                BookLoanEntry: Record "Book Loan Entry";
            begin

                Rec.TestField("Entry Type", "Entry Type"::Return);

                BookLoanEntry.Get(rec."Loan Entry No.");
                BookLoanEntry.TestField("Book Code", Rec."Book Code");
                BookLoanEntry.TestField("Book Reader Code", rec."Book Reader Code");

            end;
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "Line No." = 0 then
            "Line No." := 10000;

        if "Posting Date" = 0D then
            Validate("Posting Date", Today());
    end;
}
