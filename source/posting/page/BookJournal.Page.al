namespace LibraryOne.Posting;

page 50115 "Book Journal"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Book Journal';
    PageType = Worksheet;
    SourceTable = "Book Journal Line";
    //AutoSplitKey = true;
    //DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    //SaveValues = true;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Batch Name';
                Lookup = true;
                ToolTip = 'Specifies the name of the journal batch, a personalized journal layout, that the journal is based on.';

                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord();
                    BookJnlManagement.LookupName(CurrentJnlBatchName, Rec);

                    CurrPage.Update(false);
                end;

                trigger OnValidate()
                begin
                    BookJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                end;
            }

            repeater(General)
            {
                ShowCaption = false;

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Entry Type';
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Book Code"; Rec."Book Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Book Code field.';
                }
                field("Book Title"; Rec."Book Title")
                {
                    ToolTip = 'Title of book';
                }
                field("Book Reader Code"; Rec."Book Reader Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Book Reader Code field.';
                }
                field("Book Reader Full Name"; Rec."Book Reader Full Name")
                {
                    ToolTip = 'Full Name of Book Reader';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Loan Entry No."; Rec."Loan Entry No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Loan Entry No.';
                    ToolTip = 'Specifies the value of the Load Entry No. field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;

                action(Post)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    ShortCutKey = 'F9';
                    ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

                    trigger OnAction()
                    begin
                        CODEUNIT.Run(CODEUNIT::BookJnlManagement, Rec);
                        CurrentJnlBatchName := Rec.GetRangeMax("Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
            }
            group(Demo)
            {
                Caption = 'Demo';
                Image = Simulate;

                action(GenerateDemo)
                {
                    ApplicationArea = All;
                    Caption = 'Generate Fake Purchase and Loan Entries';
                    ToolTip = 'Generate several entries for demos';
                    Image = PostBatch;

                    trigger OnAction()
                    var
                        DemoGenerator: Codeunit "Demo Generator";
                    begin
                        DemoGenerator.GenerateBookJnlLines(CurrentJnlBatchName);
                    end;
                }

                action(GenerateReturnDemo)
                {
                    ApplicationArea = All;
                    Caption = 'Generate Fake Return Loan Entries';
                    ToolTip = 'Generate several entries for demos';
                    Image = PostBatch;

                    trigger OnAction()
                    var
                        DemoGenerator: Codeunit "Demo Generator";
                    begin
                        DemoGenerator.GenerateReturnLoanBookJnlLines(CurrentJnlBatchName);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        BookJournalTemplate: Record "Book Journal Template";
        BookJournalBatch: Record "Book Journal Batch";
    begin

        // >> Fake
        BookJournalBatch.Init();
        BookJournalBatch."Journal Template Name" := JournalTemplateNameTok;
        BookJournalBatch.Name := JournalNameTok;
        BookJournalBatch.Description := 'test description';
        if BookJournalBatch.Insert() then
            BookJournalBatch.Modify();

        BookJournalTemplate.Init();
        BookJournalTemplate.Name := JournalTemplateNameTok;
        BookJournalTemplate.Description := JournalTemplateNameTok;
        BookJournalTemplate."No. Series" := '';
        BookJournalTemplate."Posting No. Series" := '';
        if BookJournalTemplate.Insert() then
            BookJournalTemplate.Modify();
        Commit();
        // << Fake

        CurrentJnlBatchName := BookJournalBatch.Name;

        rec.FilterGroup(2);
        rec.SetRange("Journal Template Name", JournalTemplateNameTok);
        rec.SetRange("Journal Batch Name", CurrentJnlBatchName);
        rec.FilterGroup(0);

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        BookJournalLine: Record "Book Journal Line";
    begin
        BookJournalLine.SetRange("Journal Template Name", JournalTemplateNameTok);
        BookJournalLine.SetRange("Journal Batch Name", CurrentJnlBatchName);
        if BookJournalLine.FindLast() then
            Rec."Line No." := BookJournalLine."Line No." + 10000;
    end;

    var
        BookJnlManagement: Codeunit BookJnlManagement;
        CurrentJnlBatchName: Code[10];
        JournalTemplateNameTok: Label 'BOOK';
        JournalNameTok: Label 'DEFAULT';

}
