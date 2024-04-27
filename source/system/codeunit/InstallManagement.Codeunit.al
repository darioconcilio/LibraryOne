/*
namespace LibraryOne.System;

using LibraryOne.Posting;

codeunit 50104 InstallManagement
{
    Subtype = Install;

    //Include il codice per le operazioni relative al database. 
    //Viene eseguito una sola volta durante l'intero processo di installazione.
    trigger OnInstallAppPerDatabase()
    begin
        //
    end;

    //Include il codice per le operazioni relative all'azienda. 
    //Viene eseguito una volta per ogni azienda del database.
    trigger OnInstallAppPerCompany()
    var
        BookLoanEntry: Record "Book Loan Entry";
    begin
        // BookLoanEntry.SetFilter("Outbound Qty.", '<>%1', 0);
        // if BookLoanEntry.FindSet() then
        //     repeat
        //         BookLoanEntry."Outbound Qty." := Abs(BookLoanEntry."Outbound Qty.");
        //         BookLoanEntry.Modify();
        //     until BookLoanEntry.Next() = 0;
        // BookLoanEntry.Get(54);
        // BookLoanEntry."Outbound Qty." := 1;
        // BookLoanEntry.Modify();

        BookLoanEntry.Get(50);
        BookLoanEntry."Due Date" := 20250110D;
        BookLoanEntry.Modify();

        BookLoanEntry.Get(51);
        BookLoanEntry."Due Date" := 20250105D;
        BookLoanEntry.Modify();

        BookLoanEntry.Get(52);
        BookLoanEntry."Due Date" := 20250126D;
        BookLoanEntry.Modify();

        BookLoanEntry.Get(53);
        BookLoanEntry."Due Date" := 20250128D;
        BookLoanEntry.Modify();

    end;
}
*/