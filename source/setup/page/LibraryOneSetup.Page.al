namespace LibraryOne.Setup;

using LibraryOne.Setup;

page 50107 "Library One Setup"
{
    ApplicationArea = All;
    Caption = 'Library One Setup';
    PageType = Card;
    SourceTable = "Library One Setup";
    UsageCategory = Administration;
    AdditionalSearchTerms = 'library,one,setup';
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Due Days"; Rec."Due Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Due Days field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
