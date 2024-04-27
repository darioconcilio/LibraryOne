namespace LibraryOne.Posting;

codeunit 50102 PostingReturnEntry implements IPostingLoan
{
    //TableNo = "Book Journal Line";
    Permissions = TableData "Book Journal Template" = rimd,
                  TableData "Book Journal Batch" = rimd;

    /*trigger OnRun()
    var
        BookJournalLine: Record "Book Journal Line";
    begin
        BookJournalLine.Copy(Rec);
        Posting(BookJournalLine);
        Rec.Copy(BookJournalLine);
    end;*/

    procedure Posting(var BookJournalLine: Record "Book Journal Line")
    var
        BookLoanEntry: Record "Book Loan Entry";
    begin

        BookLoanEntry.Get(BookJournalLine."Loan Entry No.");
        BookLoanEntry.Quantity := 0;
        BookLoanEntry.Validate(Returned, true);
        BookLoanEntry.Modify();

    end;

}
