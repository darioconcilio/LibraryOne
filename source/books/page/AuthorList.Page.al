namespace LibraryOne.Books;

page 50109 "Author List"
{
    ApplicationArea = All;
    Caption = 'Author List';
    PageType = List;
    SourceTable = Author;
    UsageCategory = Lists;
    CardPageId = "Author Card";

    AdditionalSearchTerms = 'author';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec."Code")
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
