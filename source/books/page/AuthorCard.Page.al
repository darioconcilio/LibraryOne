namespace LibraryOne.Books;

page 50112 "Author Card"
{
    ApplicationArea = All;
    Caption = 'Author Card';
    PageType = Card;
    SourceTable = Author;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the Country/Region field.';
                }
            }
        }
    }
}
