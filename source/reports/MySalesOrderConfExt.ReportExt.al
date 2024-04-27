namespace LibraryOne.LibraryOne;

using Microsoft.Sales.Document;

reportextension 50100 "My Sales - Order Conf. Ext." extends "Standard Sales - Order Conf."
{

    dataset
    {
        add(Header)
        {
            column(OperationalInfo; Header."Operational Info")
            {
                IncludeCaption = true;
            }
            column(OperationalDueDate; Format(Header."Operational Due Date"))
            {

            }
        }
    }

    rendering
    {
        layout(MySalesOrderConfRDLC)
        {
            type = RDLC;
            LayoutFile = 'source\reports\MySalesOrderConf.ReportExt.rdlc';

        }

        layout(MySalesOrderConfWord)
        {
            type = Word;
            LayoutFile = 'source\reports\MySalesOrderConf.ReportExt.docx';

        }

    }

    labels
    {
        OperationalDueDateCaption = 'Operational Due Date', Comment = 'Operational Due Date';
    }

    trigger OnPreReport()
    begin
        //aggiungere codice da eseguire prima dell'esecuzione del report, 
        //verrà eseguito dopo l'attivazione equivalente del report originale
    end;

    trigger OnPostReport()
    begin
        // aggiungere codice da eseguire dopo l'esecuzione del report, 
        // verrà eseguito dopo l'attivazione equivalente del report originale
    end;
}
