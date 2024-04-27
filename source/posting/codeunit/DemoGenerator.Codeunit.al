namespace LibraryOne.Posting;
using LibraryOne.Books;
using System.Utilities;

codeunit 50105 "Demo Generator"
{
    procedure GenerateBookJnlLines(BatchName: Code[10])
    var
        BookJournalLine: Record "Book Journal Line";
        RecordCount: Integer;
        RandomIndex: Integer;
    begin

        BookJournalLine.Init();
        BookJournalLine."Journal Template Name" := 'BOOK';
        BookJournalLine."Journal Batch Name" := BatchName;

        for RecordCount := 1 to 1000 do begin

            BookJournalLine."Line No." += 10000;

            RandomIndex := Random(2);
            if RandomIndex = 1 then
                BookJournalLine.Validate("Entry Type", "Book Ledger Entry Type"::Purchase)
            else
                BookJournalLine.Validate("Entry Type", "Book Ledger Entry Type"::Loan);

            case BookJournalLine."Entry Type" of

                BookJournalLine."Entry Type"::Purchase:
                    begin
                        BookJournalLine.Validate("Posting Date", Today);
                        BookJournalLine.Validate("Book Code", RandomBook());
                        BookJournalLine.Validate(Quantity, Random(10));
                    end;

                BookJournalLine."Entry Type"::Loan:
                    begin
                        BookJournalLine.Validate("Posting Date", Today);
                        BookJournalLine.Validate("Book Code", RandomBook());
                        BookJournalLine.Validate("Book Reader Code", RandomBookReader());
                        BookJournalLine.Validate(Quantity, 1);
                    end;

            end;

            BookJournalLine.Insert();

        end;

    end;

    procedure GenerateReturnLoanBookJnlLines(BatchName: Code[10])
    var
        BookJournalLine: Record "Book Journal Line";
        BookLoanEntry: Record "Book Loan Entry";
        TempBookReader: Record "Book Reader" temporary;
        LoanToReturn: Integer;
        DeleteLineExistsQst: Label 'Found exists lines, do you want delete theme?';
        Tryes: Integer;
    begin

        //Init
        LoanToReturn := 50;
        Tryes := 0;

        //Verificare se esistono già righe nel batch corrente
        BookJournalLine.SetRange("Journal Template Name", 'BOOK');
        BookJournalLine.SetRange("Journal Batch Name", BatchName);
        if not BookJournalLine.IsEmpty then
            if Confirm(DeleteLineExistsQst) then
                BookJournalLine.DeleteAll(true);

        //Ciclo sui prestiti non rientrati
        BookLoanEntry.SetCurrentKey("Entry Type", Returned);
        BookLoanEntry.SetRange("Entry Type", "Book Ledger Entry Type"::Loan);
        BookLoanEntry.SetRange(Returned, false);
        if BookLoanEntry.FindSet() then
            repeat

                if Random(1) = 1 then

                    //Se il lettore ha già consegnato un libro, salto il movimento
                    if not TempBookReader.Get(BookLoanEntry."Book Reader Code") then begin

                        BookJournalLine.Init();
                        BookJournalLine."Journal Template Name" := 'BOOK';
                        BookJournalLine."Journal Batch Name" := BatchName;
                        BookJournalLine."Line No." += 10000;
                        BookJournalLine.Insert();

                        BookJournalLine.Validate("Entry Type", "Book Ledger Entry Type"::Return);
                        BookJournalLine.Validate("Posting Date", Today);
                        BookJournalLine.Validate("Book Code", BookLoanEntry."Book Code");
                        BookJournalLine.Validate("Book Reader Code", BookLoanEntry."Book Reader Code");
                        BookJournalLine.Validate(Quantity, 1);
                        BookJournalLine.Validate("Loan Entry No.", BookLoanEntry."Entry No.");
                        BookJournalLine.Modify();

                        //Traccio il lettore che ha consegnato il libro
                        TempBookReader.Init();
                        TempBookReader.Code := BookLoanEntry."Book Reader Code";
                        TempBookReader.Insert();

                        LoanToReturn -= 1;

                    end else
                        Tryes += 1

                else
                    Tryes += 1;

            until (BookLoanEntry.Next() = 0) or
                (LoanToReturn = 0) or
                (Tryes > 50);

    end;

    local procedure RandomBook() BookCode: Code[20]
    var
        Book: Record Book;
        RandomIndex: Integer;
        BookCodes: List of [Code[20]];
    begin

        //Carico i codici

        if Book.FindSet() then
            repeat

                Book.CalcFields(Availability);

                if Book.Availability > 0 then
                    BookCodes.Add(Book.Code);

            until Book.Next() = 0;

        BookCode := '';

        if BookCodes.Count > 0 then begin
            //Genero l'indice random
            RandomIndex := Random(BookCodes.Count); //L'index di List of [T] è base 1 (one-base)

            if not BookCodes.Get(RandomIndex, BookCode) then
                BookCode := '';
        end;

    end;

    local procedure RandomBookReader(): Code[20]
    var
        BookReader: Record "Book Reader";
        RandomIndex: Integer;
        BookReaderCodes: List of [Code[20]];
    begin

        //Carico i codici
        if BookReader.FindSet() then
            repeat
                BookReaderCodes.Add(BookReader.Code);
            until BookReader.Next() = 0;

        if BookReaderCodes.Count > 0 then begin

            //Genero l'indice random
            RandomIndex := Random(BookReaderCodes.Count); //L'index di List of [T] è base 1 (one-base)

            exit(BookReaderCodes.Get(RandomIndex));

        end;

        exit('');

    end;
}
