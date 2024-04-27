namespace LibraryOne.LibraryOne;

using LibraryOne.Books;

report 50100 "Available Book List"
{
    ApplicationArea = All;
    Caption = 'Available Book List';
    UsageCategory = ReportsAndAnalysis;

    DefaultLayout = RDLC;
    RDLCLayout = 'source\books\report\AvailableBookList.Report.rdlc';

    dataset
    {
        dataitem(BookRef; Book)
        {
            RequestFilterFields = Title, "Language Code", "Editor Code";

            column(Code; "Code")
            {
            }
            column(Title; Title)
            {
            }
            column(LanguageCode; "Language Code")
            {
            }

            dataitem(EditorRef; Editor)
            {
                DataItemLinkReference = BookRef;
                DataItemLink = Code = field("Editor Code");
                DataItemTableView = sorting(Code);

                column(Name;
                Name)
                {
                    IncludeCaption = true;
                }
            }

            column(ISBN10; "ISBN-10")
            {
            }
            column(Inventory; Inventory)
            {
            }
            column(OnLoan; "On Loan")
            {
            }
            column(Availability; Availability)
            {
            }

            trigger OnPreDataItem()
            begin
                if InitialFilter <> '' then
                    SetFilter(Title, '%1', StrSubstNo(InitialFilterLbl, InitialFilter));
            end;

            trigger OnAfterGetRecord()
            begin

            end;

            trigger OnPostDataItem()
            begin

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Parameters)
                {
                    Caption = 'Parameters';

                    field(InitialFilterRef; InitialFilter)
                    {
                        Caption = 'Initial Filter';
                        ToolTip = 'It filters initial of title';
                        ApplicationArea = All;
                    }
                }
            }
        }

    }

    var
        InitialFilter: Text;
        InitialFilterLbl: Label '%1*', Locked = true;
}
