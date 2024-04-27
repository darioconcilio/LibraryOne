namespace LibraryOne.Mapping;

table 50113 "Buffer Table"
{
    Caption = 'Buffer Table';
    DataClassification = ToBeClassified;

    TableType = Temporary;

    fields
    {
        field(1; "Key 1"; Text[250])
        {
            Caption = 'Key 1';
        }
        field(2; "Key 2"; Text[250])
        {
            Caption = 'Key 2';
        }
        field(3; "Key 3"; Text[250])
        {
            Caption = 'Key 3';
        }


        field(4; "Field 1"; Text[250])
        {
            Caption = 'Field 1';
        }
        field(5; "Field 2"; Text[250])
        {
            Caption = 'Field 2';
        }
        field(6; "Field 3"; Text[250])
        {
            Caption = 'Field 3';
        }
        field(7; "Field 4"; Text[250])
        {
            Caption = 'Field 4';
        }
        field(8; "Field 5"; Text[250])
        {
            Caption = 'Field 5';
        }
        field(9; "Field 6"; Text[250])
        {
            Caption = 'Field 6';
        }
    }
    keys
    {
        key(PK; "Key 1", "Key 2", "Key 3")
        {
            Clustered = true;
        }
    }
}
