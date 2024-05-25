namespace LibraryOne.LibraryOne;
using Microsoft.Inventory.Item;

codeunit 50108 "Fake Library Collects"
{
    trigger OnRun()
    begin
        GenerateMultipleErrors();
    end;

    procedure GenerateMultipleErrors()
    var
        ItemToSearch: Record Item;
    begin
        CheckItemDescription2WithAction('PIPPO');

        if ItemToSearch.FindFirst() then
            CheckItemDescription2WithAction(ItemToSearch."No.");

        if ItemToSearch.FindLast() then
            CheckItemDescription2WithAction(ItemToSearch."No.");
    end;

    local procedure CheckItemDescription2WithAction(ItemNo: Code[20])
    var
        ItemCheck: Record Item;
        ItemNotFoundErr: Label 'Item %1 not found', Comment = '%1 = Item No.';
        Description2EmptyErr: Label 'Description 2 is empty';
        ItemErrorInfo: ErrorInfo;
    begin
        if ItemCheck.Get(ItemNo) then begin
            if ItemCheck."Description 2" = '' then begin

                ItemErrorInfo := ErrorInfo.Create(Description2EmptyErr,
                                        true,
                                        ItemCheck,
                                        ItemCheck.FieldNo("No."),
                                        Page::"Item List",
                                        'CheckItemDescription2WithAction');


                ItemErrorInfo.AddAction(
                    'Set default description 2',
                    Codeunit::"Fake Library",
                    'SetDefaultDescription2'
                );
                ItemErrorInfo.AddNavigationAction('Show Details');

                Error(ItemErrorInfo);
            end;
        end else
            Error(ErrorInfo.Create(StrSubstNo(ItemNotFoundErr, ItemNo),
                                   true,
                                   ItemCheck,
                                   ItemCheck.FieldNo("No."),
                                   Page::"Item List",
                                   'CheckItemDescription2WithAction'));
    end;
}
