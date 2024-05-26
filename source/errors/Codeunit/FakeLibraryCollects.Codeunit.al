namespace LibraryOne.LibraryOne;
using Microsoft.Inventory.Item;
using System.Utilities;

codeunit 50108 "Fake Library Collects"
{
    TableNo = Item;

    trigger OnRun()
    begin
        GenerateMultipleErrors(Rec);
    end;


    procedure GenerateMultipleErrors(var rItem: Record Item)
    var
        Description2EmptyErr: Label 'Description 2 is empty';
        VendorNoEmptyErr: Label 'Vendor No. is empty';
        UnitCostItemErrorInfo: ErrorInfo;
        Description2ItemErrorInfo: ErrorInfo;
    begin
        if not Evaluate(rItem."Unit Cost", '2 euro') then begin
            UnitCostItemErrorInfo := ErrorInfo.Create(GetLastErrorText(),
                                    true,
                                    rItem,
                                    rItem.FieldNo("Unit Cost"));
            Error(UnitCostItemErrorInfo);
        end;

        if rItem."Description 2" = '' then begin

            Description2ItemErrorInfo := ErrorInfo.Create(Description2EmptyErr,
                                    true,
                                    rItem,
                                    rItem.FieldNo("Description 2"));


            Description2ItemErrorInfo.AddAction(
                'Set default description 2',
                Codeunit::"Fake Library",
                'SetDefaultDescription2'
            );
            Description2ItemErrorInfo.AddNavigationAction('Show Details');

            Error(Description2ItemErrorInfo);
        end;

        if rItem."Vendor No." = '' then begin

            Description2ItemErrorInfo := ErrorInfo.Create(VendorNoEmptyErr,
                                    true,
                                    rItem,
                                    rItem.FieldNo("Vendor No."));


            Description2ItemErrorInfo.AddAction(
                'Set default Vendor No.',
                Codeunit::"Fake Library",
                'SetDefaultVendorNo'
            );
            Description2ItemErrorInfo.AddNavigationAction('Show Details');

            Error(Description2ItemErrorInfo);
        end;

    end;

}
