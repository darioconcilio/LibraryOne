namespace LibraryOne.LibraryOne;

using Microsoft.Sales.Document;

pageextension 50100 "Sales Order Ext." extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            group(OperationalArrangements)
            {
                Caption = 'Operational arrangements';

                field("Operational Info"; Rec."Operational Info")
                {
                    ApplicationArea = All;
                    ToolTip = 'Operational info relative current order';
                }
                field("Operational Due Date"; Rec."Operational Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'this operation must be completed by';
                }
            }
        }
    }
}
