namespace LibraryOne.Books;

using Microsoft.Foundation.Address;
using LibraryOne.Posting;

table 50104 "Book Reader"
{
    Caption = 'Book Reader';
    LookupPageId = "Book Reader List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';

            trigger OnValidate()
            begin
                ComposeFullName();
            end;
        }
        field(3; "Last Name"; Text[50])
        {
            Caption = 'Last Name';

            trigger OnValidate()
            begin
                ComposeFullName();
            end;
        }
        field(4; "E-mail"; Text[80])
        {
            Caption = 'E-mail';
            ExtendedDatatype = EMail;
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; City; Text[100])
        {
            Caption = 'City';
        }
        field(7; "Post Code"; Code[5])
        {
            Caption = 'Post Code';

        }
        field(8; "County Code"; Code[2])
        {
            Caption = 'County Code';
        }
        field(9; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region';
            TableRelation = "Country/Region";
        }
        field(10; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(11; "Full Name"; Text[101])
        {
            Caption = 'Full Name';
            Editable = false;
        }
        field(12; "On Loan"; Integer)
        {
            Caption = 'On Loan';
            FieldClass = FlowField;
            CalcFormula = sum("Book Loan Entry"."Outbound Qty." where("Book Reader Code" = field(Code),
                                                               "Entry Type" = const(Loan),
                                                               Returned = const(false)));
            Editable = false;
            BlankZero = true;
        }
        field(13; "Balance Loaned"; Integer)
        {
            Caption = 'Balance Loaned';
            FieldClass = FlowField;
            CalcFormula = sum("Book Loan Entry"."Outbound Qty." where("Book Reader Code" = field(Code),
                                                               "Entry Type" = const(Loan)));
            Editable = false;
            BlankZero = true;
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
        fieldgroup(DropDown; Code, "Full Name", "On Loan")
        {
        }
    }

    local procedure ComposeFullName()
    var
        ComposedLabelTxt: Label '%1 %2', Comment = '%1 = First Name; %2 = Last Name';
    begin
        "Full Name" := StrSubstNo(ComposedLabelTxt, Rec."First Name", Rec."Last Name");
    end;
}
