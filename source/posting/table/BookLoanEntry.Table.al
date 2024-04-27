namespace LibraryOne.Posting;

using LibraryOne.Books;

table 50103 "Book Loan Entry"
{
    Caption = 'Book Loan Entry';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Book Loan Entry";
    LookupPageId = "Book Loan Entry";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            Editable = false;
        }
        field(3; "Entry Type"; Enum "Book Ledger Entry Type")
        {
            Caption = 'Entry Type';
            Editable = false;
        }
        field(4; "Book Reader Code"; Code[20])
        {
            Caption = 'Book Reader Code';
            TableRelation = "Book Reader";
            ValidateTableRelation = true;
            Editable = false;
        }
        field(5; "Book Code"; Code[20])
        {
            Caption = 'Book Code';
            TableRelation = Book;
            ValidateTableRelation = true;
            Editable = false;
        }
        field(7; "Due Date"; Date)
        {
            Caption = 'Due Date';
            Editable = false;
        }
        field(8; "Book Reader Full Name"; Text[101])
        {
            Caption = 'Book Reader Full Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Book Reader"."Full Name" where(Code = field("Book Reader Code")));
            Editable = false;
        }
        field(9; "Book Title"; Text[100])
        {
            Caption = 'Book Title';
            FieldClass = FlowField;
            CalcFormula = lookup(Book.Title where(Code = field("Book Code")));
            Editable = false;
        }
        field(10; "Book Reader E-mail"; Text[80])
        {
            Caption = 'Book Reader E-mail';
            FieldClass = FlowField;
            CalcFormula = lookup("Book Reader"."E-mail" where(Code = field("Book Reader Code")));
            Editable = false;
        }
        field(11; "Book Reader Phone No."; Text[30])
        {
            Caption = 'Book Reader Phone No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Book Reader"."Phone No." where(Code = field("Book Reader Code")));
            Editable = false;
        }
        field(12; "Returned Date"; Date)
        {
            Caption = 'Returned Date';
            Editable = false;
        }
        field(13; Returned; Boolean)
        {
            Caption = 'Returned';
            Editable = false;

            trigger OnValidate()
            begin

                if (Returned) then
                    Rec."Returned Date" := Today
                else
                    Rec."Returned Date" := 0D;

            end;
        }
        field(14; Quantity; Integer)
        {
            Caption = 'Quantity';
            Editable = false;

            trigger OnValidate()
            begin
                if Quantity < 0 then
                    "Outbound Qty." := Abs(Quantity)
                else
                    if Quantity > 0 then
                        "Inbound Qty." := Abs(Quantity)
                    else begin
                        "Inbound Qty." := Abs(Quantity);
                        "Outbound Qty." := Abs(Quantity);
                    end;
            end;
        }

        field(15; "Inbound Qty."; Integer)
        {
            Caption = 'Inbound Qty.';
            Editable = false;
        }

        field(16; "Outbound Qty."; Integer)
        {
            Caption = 'Outbound Qty.';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        key(PK2; "Posting Date", "Entry Type")
        {

        }

        key(Key3; "Book Code", Returned)
        {
            SumIndexFields = Quantity, "Outbound Qty.";
        }

        key(Key4; "Book Code", "Entry Type")
        {
            SumIndexFields = Quantity, "Outbound Qty.";
        }

        key(Key5; "Book Code", "Entry Type", Returned)
        {
            SumIndexFields = Quantity, "Outbound Qty.";
        }

        key(Key6; "Book Reader Code", "Entry Type", Returned)
        {
            SumIndexFields = Quantity, "Outbound Qty.";
        }

        key(Key7; "Entry Type", Returned)
        {

        }

    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Posting Date", "Book Code", "Book Title")
        {
        }
    }


}
