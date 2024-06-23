namespace LibraryOne.LibraryOne;

page 50125 "Format Example List"
{
    ApplicationArea = All;
    Caption = 'Format Example List';
    PageType = List;
    SourceTable = "Format Example";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.', Comment = '%';
                }
                field("Format Type"; Rec."Format Type")
                {
                    ToolTip = 'Specifies the value of the Format Type field.', Comment = '%';
                }
                field(Description; Rec."Expression Format")
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Date Value"; Rec."Date Value")
                {
                    ToolTip = 'Specifies the value of the Date Value field.', Comment = '%';
                }
                field("Date/Time Value"; Rec."Date/Time Value")
                {
                    ToolTip = 'Specifies the value of the Date/Time Value field.', Comment = '%';
                }
                field("Decimal Value"; Rec."Decimal Value")
                {
                    ToolTip = 'Specifies the value of the Decimal Value field.', Comment = '%';
                }
                field("Int Value"; Rec."Int Value")
                {
                    ToolTip = 'Specifies the value of the Int Value field.', Comment = '%';
                }
                field("Format Text"; Rec."Format Text")
                {
                    ToolTip = 'Specifies the value of the Format Text field.', Comment = '%';
                }
            }
        }
    }
}
