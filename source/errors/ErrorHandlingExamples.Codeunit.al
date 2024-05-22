namespace LibraryOne.LibraryOne;
using Microsoft.Inventory.Item;

codeunit 50104 "Error Handling Examples"
{
    var
        FakeLibrary: Codeunit "Fake Library";

    /// <summary>
    /// Gestire un errore dentro una codeunit
    /// </summary>
    local procedure GetDescriptionItem()
    var
        OperationSuccessfullyMsg: Label 'Operation occurred successfully!\Item found %1 %2', Comment = '%1 = Item No., %2 = Item Description';
        SomethingWentWrongErr: Label 'Error!\%1\Please contact partner support.', Comment = '%1 = Original error message';
        ItemNoToSearcTxt: Label 'PIPPO', Locked = true;
    begin
        FakeLibrary.InitItemNo(ItemNoToSearcTxt);
        if FakeLibrary.Run() then
            Error(SomethingWentWrongErr, GetLastErrorText())
        else
            Message(OperationSuccessfullyMsg, ItemNoToSearcTxt, FakeLibrary.GetItemDescription());
    end;

    /// <summary>
    /// Gestire l'errore con l'oggetto ErrorInfo
    /// </summary>
    local procedure GetItemDescription(ItemNoToSearch: Code[20])
    var
        ItemToSearch: Record Item;
        ItemSearchingErroInfo: ErrorInfo;
        OperationSuccessfullyMsg: Label 'Operation occurred successfully!\Item found %1 %2', Comment = '%1 = Item No., %2 = Item Description';
        ItemNoExistsTxt: Label 'Item not exists';
        ThisItemNotExistsMsg: Label 'Item No. %1 not exists in this archive.', Comment = '%1 = Item No. to search';
        SeggestedActionMsg: Label 'In order to retrieve this aritcle, you must open the article list and press New, which will allow you to create the article and later use it.';
    begin
        if ItemToSearch.Get(ItemNoToSearch) then begin

            ItemSearchingErroInfo.Title(ItemNoExistsTxt);
            ItemSearchingErroInfo.Message(StrSubstNo(ThisItemNotExistsMsg, ItemNoToSearch));
            ItemSearchingErroInfo.DetailedMessage(SeggestedActionMsg);

            Error(ItemSearchingErroInfo);

        end else
            Message(OperationSuccessfullyMsg, ItemNoToSearch, ItemToSearch.Description);
    end;

}
