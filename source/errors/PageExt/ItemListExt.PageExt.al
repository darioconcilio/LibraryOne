namespace LibraryOne.LibraryOne;

using Microsoft.Inventory.Item;
using System.Utilities;

pageextension 50101 "Item List Ext." extends "Item List"
{
    layout
    {

    }

    actions
    {
        addlast(processing)
        {
            action(SimulateErr)
            {
                ApplicationArea = All;
                Caption = 'Simulate error 1';
                ToolTip = 'Simulate an error searching PIPPO item';
                Image = Find;

                trigger OnAction()
                var
                    ErrorHandlingExamples: codeunit "Error Handling Examples";
                begin
                    ErrorHandlingExamples.GetDescriptionItem();
                end;
            }

            action(SimulateErrCurrent)
            {
                ApplicationArea = All;
                Caption = 'Simulate error 2';
                ToolTip = 'Simulate an error searching PIPPO item';
                Image = Find;

                trigger OnAction()
                var
                    Item: Record Item;
                    ErrorHandlingExamples: codeunit "Error Handling Examples";
                begin

                    //Genero l'errore
                    if Item.Get(Rec."No.") then begin
                        Item.Description := '';
                        Item.Modify();
                    end;

                    //Test con ErrorINfo
                    ErrorHandlingExamples.GetDescriptionItem('PIPPO');
                end;
            }

            action(SimulateErrCurrentWithAction)
            {
                ApplicationArea = All;
                Caption = 'Simulate error 3';
                ToolTip = 'Simulate an error searching current item with action';
                Image = Find;

                trigger OnAction()
                var
                    Item: Record Item;
                    ErrorHandlingExamples: codeunit "Error Handling Examples";
                begin

                    //Genero l'errore
                    if Item.Get(Rec."No.") then begin
                        Item.Description := '';
                        Item.Modify();
                    end;

                    //Test con ErrorINfo
                    ErrorHandlingExamples.GetItemDescriptionWithAction(Rec."No.");
                end;
            }

            action(SimulateErrTryFunction)
            {
                ApplicationArea = All;
                Caption = 'Simulate TryFunction';
                ToolTip = 'Simulate an error keeping TryFunction';
                Image = Find;

                trigger OnAction()
                var
                    Item: Record Item;
                    ErrorHandlingExamples: codeunit "Error Handling Examples";
                begin

                    //Genero l'errore
                    if Item.Get(Rec."No.") then begin
                        Item.Description := '';
                        Item.Modify();
                    end;

                    //Test con ErrorINfo
                    if Not ErrorHandlingExamples.GetDescriptionItemWithTry() then
                        Error('Internal error: %1', GetLastErrorText())
                    else
                        Message('OK!');

                end;
            }

            action(CollectErrors)
            {
                ApplicationArea = All;
                Caption = 'Simulate Collects';
                ToolTip = 'Simulate an error keeping Error Collects';
                Image = Find;

                trigger OnAction()
                begin
                    GenerateMultipleErrors();
                end;
            }
        }
    }

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure GenerateMultipleErrors()
    var
        ItemToSearch: Record Item;
        TempErrorMessage: Record "Error Message" temporary;
        CurrentErrorInfo: ErrorInfo;
    begin

        if ItemToSearch.FindFirst() then begin

            CODEUNIT.Run(Codeunit::"Fake Library Collects", ItemToSearch);

            if HasCollectedErrors then
                foreach CurrentErrorInfo in system.GetCollectedErrors() do begin
                    TempErrorMessage.ID := TempErrorMessage.ID + 1;
                    TempErrorMessage.Message := CurrentErrorInfo.Message;
                    TempErrorMessage.Validate("Record ID", CurrentErrorInfo.RecordId);
                    TempErrorMessage.Insert();
                end;

            // Clearing the collected errors will ensure the built-in error dialog
            // will not show, but instead show our own custom "Error Messages" page.
            ClearCollectedErrors();

            page.RunModal(page::"Error Messages", TempErrorMessage);


        end;
    end;



}
