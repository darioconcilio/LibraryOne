namespace LibraryOne.RoleCenter.Cue;

using System.Visualization;

page 50110 "Book Cue"
{
    ApplicationArea = All;
    Caption = 'Book Cue';
    PageType = CardPart;
    SourceTable = "Book Cue";
    RefreshOnActivate = true;
    Permissions = tabledata "Book Cue" = rm;

    layout
    {
        area(content)
        {
            cuegroup(General)
            {
                Caption = 'Book Status';

                field("Books on Loan"; Rec."Books on Loan")
                {
                    ToolTip = 'Specifies the value of the Book on Loan field.';
                }
                field("Overdue loan Books"; Rec."Overdue loan Books")
                {
                    ToolTip = 'Specifies the value of the Overdue loan Books field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Set Up Cues")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Set Up Cues';
                Image = Setup;
                ToolTip = 'Set up the cues (status tiles) related to the role.';

                trigger OnAction()
                var
                    CueRecordRef: RecordRef;
                begin
                    CueRecordRef.GetTable(Rec);
                    CuesAndKpis.OpenCustomizePageForCurrentUser(CueRecordRef.Number);
                end;
            }
        }
    }

    var
        CuesAndKpis: Codeunit "Cues And KPIs";

    trigger OnOpenPage()
    begin

        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        Rec.SetFilter("Date Filter", '<%1', Today);
        //Rec.Get();
        //Rec.CalcFields("Books on Loan", "Overdue loan Books");
    end;
}
