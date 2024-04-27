namespace LibraryOne.Posting;

codeunit 50101 PostingLoanEntry implements IPostingLoan
{
    //TableNo = "Book Journal Line";
    Permissions = TableData "Book Journal Template" = rimd,
                  TableData "Book Journal Batch" = rimd;

    /* trigger OnRun()
    var
        BookJournalLine: Record "Book Journal Line";
    begin
        BookJournalLine.Copy(Rec);
        Posting(BookJournalLine);
        Rec.Copy(BookJournalLine);
    end; */

    procedure Posting(var BookJournalLine: Record "Book Journal Line")
    var
        BookLoanEntry: Record "Book Loan Entry";
    begin

        //if BookJournalLine.FindFirst() then
        //    repeat

        BookLoanEntry.Init();

        BookLoanEntry."Entry No." := 0;
        BookLoanEntry."Posting Date" := BookJournalLine."Posting Date";
        BookLoanEntry."Entry Type" := BookJournalLine."Entry Type";
        BookLoanEntry."Book Code" := BookJournalLine."Book Code";
        BookLoanEntry."Book Reader Code" := BookJournalLine."Book Reader Code";
        BookLoanEntry.Validate(Quantity, abs(BookJournalLine.Quantity) * -1);

        BookJournalLine.TestField("Due Date");
        BookLoanEntry."Due Date" := BookJournalLine."Due Date";

        BookLoanEntry.Insert();

        //    until BookJournalLine.Next() = 0;

    end;

}
