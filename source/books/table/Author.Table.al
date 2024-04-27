namespace LibraryOne.Books;

using Microsoft.Foundation.Address;

table 50106 Author
{
    Caption = 'Author';
    DataClassification = CustomerContent;
    LookupPageId = "Author List";
    DrillDownPageId = "Author List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region';
            TableRelation = "Country/Region";
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
        fieldgroup(DropDown; Code, Name)
        {
        }
    }
}
