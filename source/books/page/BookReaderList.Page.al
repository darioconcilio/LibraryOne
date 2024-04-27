namespace LibraryOne.Books;

page 50106 "Book Reader List"
{
    ApplicationArea = All;
    Caption = 'Book Reader List';
    PageType = List;
    SourceTable = "Book Reader";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'book,reader';
    CardPageId = "Book Reader Card";

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
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Balance Loaned"; Rec."Balance Loaned")
                {
                    ToolTip = 'Specifies the value of the Balance Loaned field.';
                }

                field("On Loan"; Rec."On Loan")
                {
                    ToolTip = 'Specifies the value of the On Loan field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-mail"; Rec."E-mail")
                {
                    ToolTip = 'Specifies the value of the E-mail field.';
                }
            }
        }
    }
}
