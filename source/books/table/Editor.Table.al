namespace LibraryOne.Books;

using Microsoft.Foundation.Address;

table 50101 Editor
{
    Caption = 'Editor';
    DataClassification = OrganizationIdentifiableInformation;
    LookupPageId = "Editor List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(4; City; Text[100])
        {
            Caption = 'City';
        }
        field(5; "Post Code"; Code[5])
        {
            Caption = 'Post Code';
        }
        field(6; "County Code"; Code[2])
        {
            Caption = 'County Code';
        }
        field(7; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region';
            TableRelation = "Country/Region";
        }
        field(8; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
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
