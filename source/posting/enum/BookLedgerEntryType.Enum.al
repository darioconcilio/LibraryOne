namespace LibraryOne.Posting;

enum 50100 "Book Ledger Entry Type" implements IPostingLoan
{
    Extensible = true;

    value(0; Purchase)
    {
        Caption = 'Purchase';
        Implementation = IPostingLoan = PostingPurchaseSalesEntry;
    }
    value(1; Sales)
    {
        Caption = 'Sales';
        Implementation = IPostingLoan = PostingPurchaseSalesEntry;
    }
    value(2; Loan)
    {
        Caption = 'Loan';
        Implementation = IPostingLoan = PostingLoanEntry;
    }
    value(3; Return)
    {
        Caption = 'Return';
        Implementation = IPostingLoan = PostingReturnEntry;
    }
}
