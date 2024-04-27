namespace LibraryOne.Mapping;

using System.Reflection;

table 50112 "Mapping Line"
{
    Caption = 'Mapping Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Table Id"; Integer)
        {
            Caption = 'Table Id';
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
            ValidateTableRelation = true;
        }
        field(2; "Field Id"; Integer)
        {
            Caption = 'Field Id';

            trigger OnLookup()
            var
                CurrentField: Record Field;
                CaptionFields: Page "Caption Fields";
            begin

                CurrentField.SetRange(TableNo, Rec."Table Id");
                CurrentField.FindFirst();

                if rec."Field Id" <> 0 then begin
                    CurrentField.Get(Rec."Table Id", rec."Field Id");
                    CaptionFields.SetRecord(CurrentField);
                end;

                CaptionFields.LookupMode(true);
                CaptionFields.SetTableView(CurrentField);

                if CaptionFields.RunModal() = Action::LookupOK then begin
                    CaptionFields.GetRecord(CurrentField);
                    Rec."Field Id" := CurrentField."No.";
                end;

            end;
        }
        field(3; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Field.FieldName where(TableNo = field("Table Id"),
                                                       "No." = field("Field Id")));
        }
    }
    keys
    {
        key(PK; "Table Id", "Field Id")
        {
            Clustered = true;
        }
    }
}
