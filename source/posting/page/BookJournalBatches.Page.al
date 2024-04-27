namespace LibraryOne.Posting;

page 50116 "Book Journal Batches"
{
    ApplicationArea = All;
    Caption = 'Book Journal Batches';
    PageType = List;
    SourceTable = "Book Journal Batch";
    UsageCategory = Lists;
    DataCaptionExpression = DataCaption();

    layout
    {
        area(content)
        {
            repeater(General)
            {
                ShowCaption = false;
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

    trigger OnOpenPage()
    begin
        Rec.SetRange("Journal Template Name", 'BOOK'); //Fake
    end;

    local procedure DataCaption(): Text[250]
    var
        BookJournalTemplate: Record "Book Journal Template";
        Filter: Text;
    begin
        Filter := Rec.GetFilter("Journal Template Name");
        if Filter <> '' then
            if Rec.GetRangeMin("Journal Template Name") = Rec.GetRangeMax("Journal Template Name") then
                if BookJournalTemplate.Get(Rec.GetRangeMin("Journal Template Name")) then
                    exit(BookJournalTemplate.Name + ' ' + BookJournalTemplate.Description);
    end;
}
