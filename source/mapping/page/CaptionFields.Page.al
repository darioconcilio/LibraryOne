namespace LibraryOne.Mapping;

using System.Reflection;

page 50119 "Caption Fields"
{
    ApplicationArea = All;
    Caption = 'Caption Fields';
    PageType = List;
    SourceTable = "Field";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the ID number of the field in the table.';
                }
                field(FieldName; Rec.FieldName)
                {
                    ToolTip = 'Specifies the name of the field in the table.';
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ToolTip = 'Specifies the caption of the field, that is, the name that will be shown in the user interface.';
                }
                field(TableNo; Rec.TableNo)
                {
                    ToolTip = 'Specifies the table number.';
                }
            }
        }
    }
}
