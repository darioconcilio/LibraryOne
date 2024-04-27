namespace LibraryOne.Books;

page 50100 "Editor List"
{
    ApplicationArea = All;
    Caption = 'Editor List';
    PageType = List;
    SourceTable = Editor;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'editor';
    CardPageId = "Editor Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
            }
        }
    }
}
