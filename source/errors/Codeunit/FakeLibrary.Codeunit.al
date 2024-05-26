namespace LibraryOne.LibraryOne;
using Microsoft.Inventory.Item;
using Microsoft.Purchases.Vendor;

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

    procedure SetDefaultDescription(ItemErrorInfo: ErrorInfo)
    var
        ItemToUpdate: Record Item;
        DefaultDescriptionTxt: Label 'Descr.: %1', Comment = '%1 = Default decription';
        ItemNotFoundErr: Label 'Item %1 not found', Comment = '%1 = RecordId that not found';
    begin
        if ItemToUpdate.Get(ItemErrorInfo.RecordId) then begin
            ItemToUpdate.Validate(Description, StrSubstNo(DefaultDescriptionTxt, ItemToUpdate."No."));
            ItemToUpdate.Modify(true);
        end else
            Error(ItemNotFoundErr, ItemToUpdate.RecordId)
    end;

    procedure SetDefaultDescription2(ItemErrorInfo: ErrorInfo)
    var
        ItemToUpdate: Record Item;
        DefaultDescriptionTxt: Label 'Descr.: %1', Comment = '%1 = Default decription';
        ItemNotFoundErr: Label 'Item %1 not found', Comment = '%1 = RecordId that not found';
    begin
        if ItemToUpdate.Get(ItemErrorInfo.RecordId) then begin
            ItemToUpdate.Validate("Description 2", StrSubstNo(DefaultDescriptionTxt, ItemToUpdate."No."));
            ItemToUpdate.Modify(true);
        end else
            Error(ItemNotFoundErr, ItemToUpdate.RecordId)
    end;

    procedure SetDefaultVendorNo(ItemErrorInfo: ErrorInfo)
    var
        ItemToUpdate: Record Item;
        Vendor: Record Vendor;
        ItemNotFoundErr: Label 'Item %1 not found', Comment = '%1 = RecordId that not found';
    begin

        Vendor.FindFirst();

        if ItemToUpdate.Get(ItemErrorInfo.RecordId) then begin
            ItemToUpdate.Validate("Vendor No.", Vendor."No.");
            ItemToUpdate.Modify(true);
        end else
            Error(ItemNotFoundErr, ItemToUpdate.RecordId)
    end;

    var
        ItemNoToSearch: Code[20];
        ItemDescription: Text[100];
}
