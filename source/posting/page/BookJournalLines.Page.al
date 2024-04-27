namespace LibraryOne.Posting;

page 50114 "Book Journal Lines"
{
    ApplicationArea = All;
    Caption = 'Book Journal Lines';
    PageType = List;
    SourceTable = "Book Journal Line";
    UsageCategory = Lists;
    Editable = false;
    LinksAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                ShowCaption = false;
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ToolTip = 'Specifies the value of the Journal Template Name field.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ToolTip = 'Specifies the value of the Journal Batch Name field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Book Code"; Rec."Book Code")
                {
                    ToolTip = 'Specifies the value of the Book Code field.';
                }
                field("Book Title"; Rec."Book Title")
                {
                    ToolTip = 'Title of book';
                }
                field("Book Reader Code"; Rec."Book Reader Code")
                {
                    ToolTip = 'Specifies the value of the Book Reader Code field.';
                }
                field("Book Reader Full Name"; Rec."Book Reader Full Name")
                {
                    ToolTip = 'Full Name of Book Reader';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
            }
        }
    }
}
