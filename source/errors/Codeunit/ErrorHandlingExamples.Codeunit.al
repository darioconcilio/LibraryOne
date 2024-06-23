namespace LibraryOne.LibraryOne;
using Microsoft.Inventory.Item;

codeunit 50104 "Error Handling Examples"
{
    var
        FakeLibrary: Codeunit "Fake Library";
        OperationSuccessfullyMsg: Label 'Operation occurred successfully!\Item found %1 %2', Comment = '%1 = Item No., %2 = Item Description';

    /// <summary>
    /// Gestire un errore dentro una codeunit
    /// </summary>
    procedure GetDescriptionItem()
    var
        SomethingWentWrongErr: Label 'Error!\%1\Please contact partner support.', Comment = '%1 = Original error message';
        ItemNoToSearchTxt: Label 'PIPPO', Locked = true;
    begin
        FakeLibrary.InitItemNo(ItemNoToSearchTxt);

        if Not FakeLibrary.Run() then
            Error(SomethingWentWrongErr, GetLastErrorText())
        else
            Message(OperationSuccessfullyMsg, ItemNoToSearchTxt, FakeLibrary.GetItemDescription());

    end;

    /// <summary>
    /// Gestire l'errore con l'oggetto ErrorInfo
    /// </summary>
    procedure GetDescriptionItem(ItemNoToSearch: Code[20])
    var
        ItemToSearch: Record Item;
        ItemSearchingErroInfo: ErrorInfo;
        ItemNoExistsTxt: Label 'Item not exists';
        ThisItemNotExistsMsg: Label 'Item No. %1 not exists in this archive.', Comment = '%1 = Item No. to search';
        SeggestedActionMsg: Label 'In order to retrieve this article, you must open the article list and press New, which will allow you to create the article and later use it.';
    begin
        if not ItemToSearch.Get(ItemNoToSearch) then begin

            ItemSearchingErroInfo.Title(ItemNoExistsTxt);
            ItemSearchingErroInfo.Message(StrSubstNo(ThisItemNotExistsMsg, ItemNoToSearch));
            ItemSearchingErroInfo.DetailedMessage(SeggestedActionMsg);

            Error(ItemSearchingErroInfo);

        end else
            Message(OperationSuccessfullyMsg, ItemNoToSearch, ItemToSearch.Description);
    end;

    /// <summary>
    /// Gestire l'errore con l'oggetto ErrorInfo
    /// </summary>
    procedure GetItemDescriptionWithAction(ItemNoToSearch: Code[20])
    var
        ItemToSearch: Record Item;
        ItemSearchingErroInfo: ErrorInfo;
        ItemNoExistsTxt: Label 'Item not exists';
        ItemNotCompleteTxt: Label 'Item not complete';
        ThisItemNotExistsMsg: Label 'Item No. %1 not exists in this archive.', Comment = '%1 = Item No. to search';
        SuggestedActionMsg: Label 'In order to retrieve this aritcle, you must open the article list and press New, which will allow you to create the article and later use it.';
        ItemNotCompletedMsg: Label 'Item %1 not completed, you have to complete its description', Comment = '%1 = Item No. to complete';
        SuggestedActionCompleteMsg: Label 'You can open Item Card and set description';
    begin

        //Se non trovo l'articolo
        if not ItemToSearch.Get(ItemNoToSearch) then begin

            Clear(ItemSearchingErroInfo);
            ItemSearchingErroInfo.Title(ItemNoExistsTxt);
            ItemSearchingErroInfo.Message(StrSubstNo(ThisItemNotExistsMsg, ItemNoToSearch));
            ItemSearchingErroInfo.DetailedMessage(SuggestedActionMsg);

            Error(ItemSearchingErroInfo);

        end;

        //Se l'articolo non ha la descrizione valorizzata
        if ItemToSearch."Description 2" = '' then begin

            Clear(ItemSearchingErroInfo);
            ItemSearchingErroInfo.Title(ItemNotCompleteTxt);
            ItemSearchingErroInfo.Message(StrSubstNo(ItemNotCompletedMsg, ItemNoToSearch));
            ItemSearchingErroInfo.DetailedMessage(SuggestedActionCompleteMsg);

            ItemSearchingErroInfo.RecordId := ItemToSearch.RecordId;
            ItemSearchingErroInfo.AddAction(
                    'Set default description',
                    Codeunit::"Fake Library",
                    'SetDefaultDescription2'
                );

            ItemSearchingErroInfo.PageNo := Page::"Item Card";
            ItemSearchingErroInfo.AddNavigationAction('Open item card');

            Error(ItemSearchingErroInfo);
        end;

        //Tutto OK!
        Message(OperationSuccessfullyMsg, ItemNoToSearch, ItemToSearch.Description);

    end;

    [TryFunction]
    procedure GetDescriptionItemWithTry()
    var
        SomethingWentWrongErr: Label 'Error!\%1\Please contact partner support.', Comment = '%1 = Original error message';
        ItemNoToSearchTxt: Label 'PIPPO', Locked = true;
        ItemToSearch: Record Item;
    begin

        ItemToSearch.Get(ItemNoToSearchTxt);
        Message(OperationSuccessfullyMsg, ItemNoToSearchTxt, ItemToSearch.Description);

    end;



}
