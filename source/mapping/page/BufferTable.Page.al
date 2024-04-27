namespace LibraryOne.Mapping;

page 50120 "Buffer Table"
{
    ApplicationArea = All;
    Caption = 'Buffer Table';
    PageType = List;
    SourceTable = "Buffer Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Key 1"; Rec."Key 1")
                {
                    ToolTip = 'Specifies the value of the Key 1 field.';
                }
                field("Key 2"; Rec."Key 2")
                {
                    ToolTip = 'Specifies the value of the Key 2 field.';
                }
                field("Key 3"; Rec."Key 3")
                {
                    ToolTip = 'Specifies the value of the Key 3 field.';
                }
                field("Field 1"; Rec."Field 1")
                {
                    ToolTip = 'Specifies the value of the Field 1 field.';
                }
                field("Field 2"; Rec."Field 2")
                {
                    ToolTip = 'Specifies the value of the Field 2 field.';
                }
                field("Field 3"; Rec."Field 3")
                {
                    ToolTip = 'Specifies the value of the Field 3 field.';
                }
                field("Field 4"; Rec."Field 4")
                {
                    ToolTip = 'Specifies the value of the Field 4 field.';
                }
                field("Field 5"; Rec."Field 5")
                {
                    ToolTip = 'Specifies the value of the Field 5 field.';
                }
                field("Field 6"; Rec."Field 6")
                {
                    ToolTip = 'Specifies the value of the Field 6 field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        LoadDataByMapping();
    end;

    local procedure LoadDataByMapping()
    var
        MappingHeader: Record "Mapping Header";
        MappingLine: Record "Mapping Line";
        MappingHeaderRecordRef: RecordRef;
        MappingLineFieldRef: FieldRef;
        FilterFieldRef: FieldRef;
        FieldId: Integer;
    begin

        //Prendo il primo mapping come esempio
        MappingHeader.FindFirst();

        MappingHeaderRecordRef.Open(MappingHeader."Table Id");

        MappingLine.SetRange("Table Id", MappingHeader."Table Id");
        if MappingLine.FindSet() then begin
            FilterFieldRef := MappingHeaderRecordRef.Field(MappingLine."Field Id");
            FilterFieldRef.SetRange(1); //FAKE!!! Document Type 1 = Order
        end;

        if MappingHeaderRecordRef.FindSet() then
            repeat

                FieldId := 0;

                rec.Init();

                MappingLine.SetRange("Table Id", MappingHeader."Table Id");
                if MappingLine.FindSet() then
                    //Recupero dei dati
                    repeat

                        MappingLineFieldRef := MappingHeaderRecordRef.Field(MappingLine."Field Id");

                        case MappingLineFieldRef.Class of

                            MappingLineFieldRef.Class::Normal:
                                begin
                                    FieldId += 1;
                                    SetValue(FieldId, MappingLineFieldRef.Value);
                                end;

                            MappingLineFieldRef.Class::FlowField:
                                begin
                                    FieldId += 1;
                                    MappingLineFieldRef.CalcField();
                                    SetValue(FieldId, MappingLineFieldRef.Value);
                                end;

                        end;

                    until MappingLine.Next() = 0;

                Rec.Insert();

            until MappingHeaderRecordRef.Next() = 0;

    end;

    local procedure SetValue(FieldNo: Integer; FieldValue: Text[250])
    begin

        case FieldNo of
            1:
                rec."Key 1" := FieldValue;
            2:
                rec."Key 2" := FieldValue;
            3:
                rec."Key 3" := FieldValue;
            4:
                rec."Field 1" := FieldValue;
            5:
                rec."Field 2" := FieldValue;
            6:
                rec."Field 3" := FieldValue;
            7:
                rec."Field 4" := FieldValue;
            8:
                rec."Field 5" := FieldValue;
            9:
                rec."Field 6" := FieldValue;

        end;

    end;
}
