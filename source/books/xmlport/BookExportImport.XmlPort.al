xmlport 50100 "Book Export/Import"
{
    Caption = 'Book Export/Import';

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Book; Book)
            {
                RequestFilterFields = "Author Code", "Language Code";

                fieldelement(Code; Book."Code")
                {
                    //Questo trigger viene utilizzato solo per importare i dati. 
                    //Consente di accedere ai valori nel record importato 
                    //e viene in genere utilizzato per modificare i dati importati.
                    trigger OnAfterAssignField()
                    begin

                    end;

                    //Questo trigger viene utilizzato solo per esportare i dati. 
                    //Questo trigger consente di accedere al valore del campo nel record 
                    //appena prima che venga esportato 
                    //e viene in genere utilizzato per modificare il campo.
                    trigger OnBeforePassField()
                    begin

                    end;
                }
                fieldelement(Title; Book.Title)
                {
                }
                fieldelement(LiteraryGenreCode; Book."Literary Genre Code")
                {
                }
                fieldelement(LanguageCode; Book."Language Code")
                {
                    textattribute(Code2)
                    {
                        //Questo trigger viene utilizzato solo per importare i dati 
                        //e consente di accedere al valore importato in formato testo.
                        trigger OnAfterAssignVariable()
                        begin

                        end;

                        //Questo trigger viene utilizzato solo per esportare i dati 
                        //e viene in genere utilizzato per manipolare la variabile di testo.
                        trigger OnBeforePassVariable()
                        begin

                        end;
                    }
                }
                textelement(Codes)
                {

                    fieldattribute(ISBN10; Book."ISBN-10")
                    {
                        //Questo trigger viene utilizzato solo per importare i dati. 
                        //Consente di accedere ai valori nel record importato 
                        //e viene in genere utilizzato per modificare i dati importati.
                        trigger OnAfterAssignField()
                        begin

                        end;

                        //Questo trigger viene utilizzato solo per esportare i dati. 
                        //Questo trigger consente di accedere al valore del campo nel record 
                        //appena prima che venga esportato e viene in genere utilizzato 
                        //per modificare il campo.
                        trigger OnBeforePassField()
                        begin

                        end;
                    }
                    fieldattribute(ISBN13; Book."ISBN-13")
                    {
                    }

                    //Questo trigger viene utilizzato solo per importare i dati 
                    //e consente di accedere al valore importato in formato testo.
                    trigger OnAfterAssignVariable()
                    begin

                    end;

                    //Questo trigger viene utilizzato solo per esportare i dati 
                    //e viene in genere utilizzato per manipolare la variabile di testo.
                    trigger OnBeforePassVariable()
                    begin

                    end;
                }
                fieldelement(Note; Book.Note)
                {
                }
                fieldelement(AuthorCode; Book."Author Code")
                {
                }

                //Questo trigger viene utilizzato solo per esportare i dati. 
                //Viene in genere utilizzato per impostare filtri sui dati 
                //e per inizializzare le variabili prima di trovare il primo record.
                trigger OnPreXmlItem()
                begin

                end;

                //Questo trigger viene utilizzato solo per importare i dati. 
                //Viene in genere utilizzato per impostare le condizioni preliminari 
                //per il record prima che venga inserito nella tabella del database.
                trigger OnAfterInitRecord()
                begin

                end;

                //Questo trigger viene utilizzato solo per importare i dati. 
                //Viene in genere utilizzato per la valutazione o i calcoli prima che 
                //il record venga inserito nella tabella del database.
                //Se la proprietà AutoSave è false, anche se il record non viene inserito automaticamente, 
                //il trigger OnBeforeInsertRecord viene comunque chiamato prima che l'inserimento fosse stato eseguito.
                trigger OnBeforeInsertRecord()
                begin

                end;

                //Questo trigger viene utilizzato solo per importare dati e può essere utilizzato 
                //per spostare i dati da tabelle temporanee a tabelle reali.
                //Se la proprietà AutoSave è false, anche se il record non viene inserito automaticamente, 
                //il trigger OnAfterInsertRecord viene comunque chiamato dopo che si è verificato l'inserimento.
                trigger OnAfterInsertRecord()
                begin

                end;

                //Questo trigger viene utilizzato quando si importano dati da una porta XML 
                //e quindi si aggiorna un record esistente in una tabella con i dati della porta XML.
                //Se la proprietà AutoSave è false, anche se il record non viene modificato automaticamente, 
                //il trigger OnBeforeModifyRecord viene comunque chiamato prima che si verificasse la modifica.
                trigger OnBeforeModifyRecord()
                begin

                end;

                //Questo trigger viene utilizzato quando si importano dati da una porta XML 
                //e quindi si aggiorna un record esistente in una tabella con i dati della porta XML.
                //Se la proprietà AutoSave è false, anche se il record non viene modificato automaticamente, 
                //il trigger OnAfterModifyRecord viene comunque chiamato dopo che si è verificata la modifica.
                trigger OnAfterModifyRecord()
                begin

                end;

                //Questo trigger viene utilizzato solo per esportare i dati. 
                //Viene in genere utilizzato per modificare i campi che vengono esportati dalla tabella 
                //e per calcolare le variabili che dipendono dal record.
                trigger OnAfterGetRecord()
                begin

                end;






            }
        }
    }

}
