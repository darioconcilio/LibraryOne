namespace LibraryOne.Experimental.Temporary;

using LibraryOne.Books;

page 50124 "Temporary Test Data Entry"
{
    ApplicationArea = All;
    Caption = 'Temporary Test Data Entry';
    PageType = List;
    SourceTable = Book;
    UsageCategory = Tasks;

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
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Editor Code"; Rec."Editor Code")
                {
                    ToolTip = 'Specifies the value of the Editor Code field.';
                }
                field("Author Code"; Rec."Author Code")
                {
                    ToolTip = 'Specifies the value of the Author Code field.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ToolTip = 'Specifies the value of the Language Code field.';
                }
                field(Note; Rec.Note)
                {
                    ToolTip = 'Specifies the value of the Note field.';
                }
            }
        }
    }
}
