namespace LibraryOne.LibraryOne;

using Microsoft.Sales.Document;

tableextension 50100 "Sales Header Ext." extends "Sales Header"
{
    fields
    {
        field(50100; "Operational Info"; Text[250])
        {
            Caption = 'Operational Info';
            DataClassification = ToBeClassified;
        }
        field(50101; "Operational Due Date"; Date)
        {
            Caption = 'Operational Due Date';
            DataClassification = ToBeClassified;
        }
    }
}
