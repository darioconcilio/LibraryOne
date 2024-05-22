namespace LibraryOne.LibraryOne;
using Microsoft.Inventory.Item;

codeunit 50107 "Fake Library"
{
    trigger OnRun()
    var
        ItemToSearch: Record Item;
    begin
        ItemToSearch.Get(ItemNoToSearch);
        ItemDescription := ItemToSearch.Description;
    end;

    procedure InitItemNo(ItemNo: Code[20])
    begin
        ItemNoToSearch := ItemNo;
    end;

    procedure GetItemDescription(): Text[100]
    begin
        exit(ItemDescription);
    end;

    var
        ItemNoToSearch: Code[20];
        ItemDescription: Text[100];
}
