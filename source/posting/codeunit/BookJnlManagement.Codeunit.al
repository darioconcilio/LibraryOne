namespace LibraryOne.Posting;

codeunit 50100 BookJnlManagement
{
    TableNo = "Book Journal Line";
    Permissions = TableData "Book Journal Template" = rimd,
                  TableData "Book Journal Batch" = rimd;

    trigger OnRun()
    var
        BookJournalLine: Record "Book Journal Line";
    begin
        BookJournalLine.Copy(Rec);
        Posting(BookJournalLine);
        Rec.Copy(BookJournalLine);
    end;

    local procedure Posting(var BookJournalLine: Record "Book Journal Line")
    var
        PostingLoan: Interface IPostingLoan;
        PostedLinesOkMsg: Label 'Posting done!';
        PostingDialog: Dialog;
        PostingProgressLbl: Label 'Line No.  #1################\Book Code #2################', Comment = '%1 = Line No.;%2 = Code of book';
    begin

        if GuiAllowed then
            PostingDialog.Open(PostingProgressLbl);

        if BookJournalLine.FindFirst() then
            repeat

                PostingLoan := BookJournalLine."Entry Type";
                PostingLoan.Posting(BookJournalLine);

                if GuiAllowed then begin
                    PostingDialog.Update(1, BookJournalLine."Line No.");
                    PostingDialog.Update(2, BookJournalLine."Book Code");
                end;

            until BookJournalLine.Next() = 0;

        BookJournalLine.DeleteAll();

        if GuiAllowed then begin
            PostingDialog.Close();
            Message(PostedLinesOkMsg);
        end

    end;

    procedure LookupName(var CurrentJnlBatchName: Code[10]; var BookJournalLine: Record "Book Journal Line")
    var
        BookJournalBatch: Record "Book Journal Batch";
        BookJournalBatches: Page "Book Journal Batches";
    begin

        BookJournalBatch.Get('BOOK', CurrentJnlBatchName); //BOOK = Fake

        BookJournalBatches.SetRecord(BookJournalBatch);
        BookJournalBatches.LookupMode(true);
        if BookJournalBatches.RunModal() = ACTION::LookupOK then begin
            BookJournalBatches.GetRecord(BookJournalBatch);
            CurrentJnlBatchName := BookJournalBatch.Name;
            SetName(CurrentJnlBatchName, BookJournalLine);
        end;

    end;

    procedure SetName(CurrentJnlBatchName: Code[10]; var BookJournalLine: Record "Book Journal Line")
    begin
        BookJournalLine.FilterGroup := 2;
        BookJournalLine.SetRange("Journal Batch Name", CurrentJnlBatchName);
        BookJournalLine.FilterGroup := 0;
        if BookJournalLine.FindSet() then; //Sotto if, così non mi da errore se non trova nulla...
    end;

    procedure CheckName(CurrentJnlBatchName: Code[10]; var BookJournalLine: Record "Book Journal Line")
    var
        BookJournalBatch: Record "Book Journal Batch";
    begin

        BookJournalBatch.Get(BookJournalLine.GetRangeMax("Journal Template Name"), CurrentJnlBatchName);
    end;

}
