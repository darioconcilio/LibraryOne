namespace LibraryOne.Mapping;

using System.Reflection;

table 50111 "Mapping Header"
{
    Caption = 'Mapping Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Table Id"; Integer)
        {
            Caption = 'Table Id';
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
            ValidateTableRelation = true;
        }
        field(2; "Table Name"; Text[30])
        {
            Caption = 'Table Name';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(AllObjWithCaption."Object Name" where("Object ID" = field("Table Id")));
        }
    }
    keys
    {
        key(PK; "Table Id")
        {
            Clustered = true;
        }
    }
}
