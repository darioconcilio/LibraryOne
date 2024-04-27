namespace LibraryOne.Mapping;

page 50117 "Mapping Lines"
{
    ApplicationArea = All;
    Caption = 'Mapping Lines';
    PageType = ListPart;
    SourceTable = "Mapping Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Table Id"; Rec."Table Id")
                {
                    ToolTip = 'Specifies the value of the Table Id field.';
                    Visible = false;
                }
                field("Field Id"; Rec."Field Id")
                {
                    ToolTip = 'Specifies the value of the Field Id field.';
                }
                field("Field Name"; Rec."Field Name")
                {
                    ToolTip = 'Specifies the value of the Field Name field.';
                }
            }
        }
    }
}
