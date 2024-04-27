namespace LibraryOne.LibraryOne;

using LibraryOne.Books;
using Microsoft.Foundation.Company;

report 50101 "Av. Book List (MultiLayout)"
{
    ApplicationArea = All;
    Caption = 'Available Book List';
    UsageCategory = ReportsAndAnalysis;

    DefaultRenderingLayout = AvailableBookListForExcel;
    //ExcelLayoutMultipleDataSheets = true;

    dataset
    {
        dataitem(BookRef; Book)
        {
            RequestFilterFields = Title, "Language Code", "Editor Code";

            column(Code; "Code")
            {
                IncludeCaption = true;
            }
            column(Title; Title)
            {
                IncludeCaption = true;
            }
            column(LanguageCode; "Language Code")
            {
                IncludeCaption = true;
            }
            dataitem(LiteraryGenreRef; "Literary Genre")
            {
                DataItemLinkReference = BookRef;
                DataItemLink = Code = field("Literary Genre Code");
                DataItemTableView = sorting(Code);
                column(LiteraryGenreName; Name)
                {
                    IncludeCaption = true;
                }
                column(Description; Description)
                {

                }
            }

            dataitem(BookEditorRef; Editor)
            {
                DataItemLinkReference = BookRef;
                DataItemLink = Code = field("Editor Code");
                DataItemTableView = sorting(Code);

                column(EditorName; Name)
                {
                    //IncludeCaption = true;
                }
            }

            column(ISBN10; "ISBN-10")
            {
                IncludeCaption = true;
            }
            column(Inventory; Inventory)
            {
                IncludeCaption = true;
            }
            column(OnLoan; "On Loan")
            {
                IncludeCaption = true;
            }
            column(Availability; Availability)
            {
                IncludeCaption = true;
            }

            column(Logo; CompanyInformation.Picture)
            {
                IncludeCaption = true;
            }

            column(CompanyName; CompanyInformation.Name)
            {
                IncludeCaption = true;
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

    rendering
    {
        layout(AvailableBookListForWord)
        {
            type = Word;
            LayoutFile = 'source\books\report\AvailableBookListForWord.docx';

        }

        layout(AvailableBookListForExcel)
        {
            Type = Excel;
            LayoutFile = 'source\books\report\pippo.xlsx';
            //LayoutFile = 'source\books\report\AvailableBookListForExcel.xlsx';
        }
    }

    labels
    {
        EditorSubTitle = 'Editors', Comment = 'Editors for pivot';
        EditorNameCaption = 'Editor Name', Comment = 'Name of editor';
    }

    trigger OnInitReport()
    begin

    end;

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
        CompanyInformation.TestField(Picture);
    end;

    trigger OnPostReport()
    begin

    end;

    var
        CompanyInformation: Record "Company Information";
        InitialFilter: Text;
        InitialFilterLbl: Label '%1*', Locked = true;
}
