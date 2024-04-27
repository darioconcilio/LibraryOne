namespace LibraryOne.Books;

using System.Globalization;
using LibraryOne.Posting;

table 50100 Book
{
    Caption = 'Book';
    DataClassification = ToBeClassified;
    LookupPageId = "Book List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Title; Text[100])
        {
            Caption = 'Title';
        }
        field(3; "Literary Genre Code"; Code[10])
        {
            Caption = 'Literary Genre Code';
            TableRelation = "Literary Genre";
        }
        field(4; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = ToBeClassified;
            TableRelation = Language;
        }
        field(5; "ISBN-10"; Text[50])
        {
            Caption = 'ISBN-10', Locked = true;
            DataClassification = ToBeClassified;
        }
        field(6; "ISBN-13"; Text[50])
        {
            Caption = 'ISBN-13', Locked = true;
            DataClassification = ToBeClassified;
        }
        field(7; Note; Text[1024])
        {
            Caption = 'Note';
            DataClassification = ToBeClassified;
        }
        field(8; "Image Url"; Text[1024])
        {
            Caption = 'Image Url';
            DataClassification = ToBeClassified;
        }
        field(9; "Author Code"; Code[20])
        {
            Caption = 'Author Code';
            TableRelation = Author;
        }
        field(10; Inventory; Integer)
        {
            Caption = 'Inventory';
            FieldClass = FlowField;
            CalcFormula = sum("Book Loan Entry".Quantity where("Book Code" = field(Code),
                                                               "Entry Type" = filter(Purchase | Sales)));
            Editable = false;
            BlankZero = true;
        }
        field(11; "On Loan"; Integer)
        {
            Caption = 'On Loan';
            FieldClass = FlowField;
            CalcFormula = sum("Book Loan Entry"."Outbound Qty." where("Book Code" = field(Code),
                                                               "Entry Type" = const(Loan),
                                                               Returned = const(false)));
            Editable = false;
            BlankZero = true;
        }
        field(12; Availability; Integer)
        {
            Caption = 'Availability';
            FieldClass = FlowField;
            CalcFormula = sum("Book Loan Entry".Quantity where("Book Code" = field(Code)));
            Editable = false;
            BlankZero = true;
        }
        field(13; "Editor Code"; Code[20])
        {
            Caption = 'Editor Code';
            TableRelation = Editor;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        fieldgroup(DropDown; Code, Title, Availability, "On Loan")
        {
        }
    }
}
