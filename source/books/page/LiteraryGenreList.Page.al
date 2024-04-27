namespace LibraryOne.Book;

using LibraryOne.Books;

page 50102 "Literary Genre List"
{
    ApplicationArea = All;
    Caption = 'Literary Genre List';
    PageType = List;
    SourceTable = "Literary Genre";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'literary,genre';

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
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
