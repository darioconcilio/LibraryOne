namespace LibraryOne.Books;

page 50104 "Book Card"
{
    ApplicationArea = All;
    Caption = 'Book Card';
    PageType = Card;
    SourceTable = Book;
    UsageCategory = Tasks;

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
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Literary Genre Code"; Rec."Literary Genre Code")
                {
                    ToolTip = 'Indicate the literary genre for the selected book';
                }
                field("Author Code"; Rec."Author Code")
                {
                    ToolTip = 'Specifies the value of the Author Code field.';
                }
                field("Editor Code"; Rec."Editor Code")
                {
                    ToolTip = 'Specifies the value of the Editor Code field.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ToolTip = 'Specifies the value of the Language Code field.';
                }
                field("ISBN-10"; Rec."ISBN-10")
                {
                    ToolTip = 'Specifies the value of the ISBN-10 field.';
                }
                field("ISBN-13"; Rec."ISBN-13")
                {
                    ToolTip = 'Specifies the value of the ISBN-13 field.';
                }
            }
            group(AdditionalInfo)
            {
                field("Image Url"; Rec."Image Url")
                {
                    ToolTip = 'Specifies the value of the Image Url field.';
                }
                field(Note; Rec.Note)
                {
                    ToolTip = 'Specifies the value of the Note field.';
                }
            }

            group(Loan)
            {
                Caption = 'Loan';

                field(Inventory; Rec.Inventory)
                {
                    ToolTip = 'Specifies the value of the Inventory field.';
                }

                field("On Loan"; Rec."On Loan")
                {
                    ToolTip = 'Specifies the value of the On Loan field.';
                }

                field(Availability; Rec.Availability)
                {
                    ToolTip = 'Specifies the value of the Availability field.';
                }
            }
        }
    }
}
