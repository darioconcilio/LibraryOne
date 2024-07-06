namespace LibraryOne.LibraryOne;

page 50127 "Book Request List"
{
    ApplicationArea = All;
    Caption = 'Book Request List';
    PageType = List;
    SourceTable = "Book Custom Request";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ToolTip = 'Specifies the value of the Request Date field.', Comment = '%';
                }
                field("Book Reader Code"; Rec."Book Reader Code")
                {
                    ToolTip = 'You have to choose book reader that what request a customization of book';
                }
                field("Book Code"; Rec."Book Code")
                {
                    ToolTip = 'You have to choose book that book reader what requests for customizzation';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'You have to specify how much books book reader whants';
                }
                field("Cover Type"; Rec."Cover Type")
                {
                    ToolTip = 'You can specify which type of cover must have a book.\It''s an optional request.';
                }
                field("Cover Color"; Rec."Cover Color")
                {
                    ToolTip = 'If you choose a cover, you have to choose a color of conver.';
                }
                field("Print Custom Description"; Rec."Print Custom Description")
                {
                    ToolTip = 'You can specify additional description printed on book.\It''s an optional request.';
                }
                field("Primary Custom Description"; Rec."Primary Custom Description")
                {
                    ToolTip = 'If you choose a print service, you can specify a description that you want print on a book.\It will print on a first line.';
                }
                field("Secondary Custom Description"; Rec."Secondary Custom Description")
                {
                    ToolTip = 'If you choose a print service, you can specify a description that you want print on a book.\It will print on a second line.';
                }
                field(Confirmed; Rec.Confirmed)
                {
                    ToolTip = 'Specifies the value of the Confirmed field.', Comment = '%';
                }
            }
        }
    }
}
