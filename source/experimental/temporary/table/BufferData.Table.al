namespace LibraryOne.Experimental.Temporary;

table 50114 "Buffer Data"
{
    Caption = 'Buffer Data';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Address; Text[100])
        {
            Caption = 'Address';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

}
