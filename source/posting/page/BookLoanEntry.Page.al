namespace LibraryOne.Posting;

page 50108 "Book Loan Entry"
{
    ApplicationArea = All;
    Caption = 'Book Loan Entry';
    PageType = List;
    SourceTable = "Book Loan Entry";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'book,loan,entry';
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Book Code"; Rec."Book Code")
                {
                    ToolTip = 'Specifies the value of the Book Code field.';
                }
                field("Book Title"; Rec."Book Title")
                {
                    ToolTip = 'Specifies the value of the Book Title field.';
                }
                field("Book Reader Code"; Rec."Book Reader Code")
                {
                    ToolTip = 'Specifies the value of the Book Reader Code field.';
                }
                field("Book Reader Full Name"; Rec."Book Reader Full Name")
                {
                    ToolTip = 'Specifies the value of the Book Reader Full Name field.';
                }
                field("Book Reader E-mail"; Rec."Book Reader E-mail")
                {
                    ToolTip = 'Specifies the value of the Book Reader E-mail field.';
                }
                field("Book Reader Phone No."; Rec."Book Reader Phone No.")
                {
                    ToolTip = 'Specifies the value of the Book Reader Phone No. field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Due Date field.';
                    Style = Unfavorable;
                    StyleExpr = ExpiredLoad;
                }
                field("Inbound Qty."; Rec."Inbound Qty.")
                {
                    ToolTip = 'Specifies the value of the Inbound Qty. field.';
                }
                field("Outbound Qty."; Rec."Outbound Qty.")
                {
                    ToolTip = 'Specifies the value of the Outbound Qty. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Returned; Rec.Returned)
                {
                    ToolTip = 'Specifies the value of the Returned field.';
                }

                field("Returned Date"; Rec."Returned Date")
                {
                    ToolTip = 'Specifies the value of the Returned Date field.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ExpiredLoad := Rec."Due Date" < Today();
    end;

    var
        ExpiredLoad: Boolean;
}
