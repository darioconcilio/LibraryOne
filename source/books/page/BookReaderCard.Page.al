namespace LibraryOne.Books;

page 50105 "Book Reader Card"
{
    ApplicationArea = All;
    Caption = 'Book Reader Card';
    PageType = Card;
    SourceTable = "Book Reader";
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
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("County Code"; Rec."County Code")
                {
                    ToolTip = 'Specifies the value of the County Code field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the Country/Region field.';
                }

            }
            group(Communication)
            {
                Caption = 'Communication';

                field("E-mail"; Rec."E-mail")
                {
                    ToolTip = 'Specifies the value of the E-mail field.';
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
            }

            group(Loan)
            {
                Caption = 'Loan';

                field("Balance Loaned"; Rec."Balance Loaned")
                {
                    ToolTip = 'Specifies the value of the Balance Loaned field.';
                }

                field("On Loan"; Rec."On Loan")
                {
                    ToolTip = 'Specifies the value of the On Loan field.';
                }
            }
        }
    }
}
