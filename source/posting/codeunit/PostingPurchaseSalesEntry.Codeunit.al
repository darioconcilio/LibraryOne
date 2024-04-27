namespace LibraryOne.Posting;

codeunit 50103 PostingPurchaseSalesEntry implements IPostingLoan
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
        Quantity: Integer;
    begin

        BookLoanEntry.Init();
        BookLoanEntry."Entry No." := 0;
        BookLoanEntry."Posting Date" := BookJournalLine."Posting Date";
        BookLoanEntry."Entry Type" := BookJournalLine."Entry Type";
        BookLoanEntry."Book Code" := BookJournalLine."Book Code";

        //Tanto per far vedere un'altro approccio
        case BookJournalLine."Entry Type" of

            "Book Ledger Entry Type"::Purchase:
                begin
                    Quantity := abs(BookJournalLine.Quantity);
                    BookLoanEntry."Inbound Qty." := Quantity;
                end;

            "Book Ledger Entry Type"::Sales:
                begin
                    BookLoanEntry."Book Reader Code" := BookJournalLine."Book Reader Code";

                    Quantity := abs(BookJournalLine.Quantity) * -1;
                    BookLoanEntry."Outbound Qty." := abs(BookJournalLine.Quantity);
                end;

        end;

        BookLoanEntry.Quantity := Quantity;

        BookLoanEntry.Insert();

    end;

}
