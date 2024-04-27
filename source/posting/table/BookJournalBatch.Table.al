namespace LibraryOne.Posting;
using LibraryOne.Books;

table 50109 "Book Journal Batch"
{
    Caption = 'Book Journal Batch';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = true;
            TableRelation = "Book Journal Template";
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }

    }
    keys
    {
        key(Key1; "Journal Template Name", Name)
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    /*var
        ble: Record "Book Loan Entry";
        br: Record "Book Reader";*/
    begin
        BookJournalLine.SetRange("Journal Template Name", Rec."Journal Template Name");
        BookJournalLine.SetRange("Journal Batch Name", Rec.Name);
        BookJournalLine.DeleteAll(true);

        /*ble.SetRange("Posting Date", 20230101D, 20231231D);
        br.SetRange(Code, 'LET00010', 'LET00022');
        ble.SetRange("Entry Type", "Book Ledger Entry Type"::Sales, "Book Ledger Entry Type"::Return);
        ble.SetFilter("Entry Type", '%1|%2|%3', "Book Ledger Entry Type"::Sales,
                                              "Book Ledger Entry Type"::Purchase,
                                              "Book Ledger Entry Type"::Return);

        br.Get('LET00010');
        br.SetRecFilter();*/
    end;

    trigger OnRename()
    begin
        BookJournalLine.SetRange("Journal Template Name", xRec."Journal Template Name");
        BookJournalLine.SetRange("Journal Batch Name", xRec.Name);
        while BookJournalLine.FindFirst() do
            BookJournalLine.Rename("Journal Template Name", Name, BookJournalLine."Line No.");
    end;

    var
        BookJournalLine: Record "Book Journal Line";

}
