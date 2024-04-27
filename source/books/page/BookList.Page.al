namespace LibraryOne.Books;
using LibraryOne.LibraryOne;

page 50101 "Book List"
{
    ApplicationArea = All;
    Caption = 'Book List';
    PageType = List;
    SourceTable = Book;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'book';
    CardPageId = "Book Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ToolTip = 'Specifies the value of the Inventory field.';
                }

                field("On Loan"; Rec."On Loan")
                {
                    ToolTip = 'Specifies the value of the On Loan field.';
                }

                field(Availability; Rec.Availability)
                {
                    ToolTip = 'Specifies the value of the Availability field.';
                }
                field("Literary Genre Code"; Rec."Literary Genre Code")
                {
                    ToolTip = 'Indicate the literary genre for the selected book';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Language Code field.';
                }
                field("Author Code"; Rec."Author Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Author Code field.';
                }
                field("Editor Code"; Rec."Editor Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Editor Code field.';
                }
                field("ISBN-10"; Rec."ISBN-10")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ISBN-10 field.';
                }
                field("ISBN-13"; Rec."ISBN-13")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ISBN-13 field.';
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            group(Utilities)
            {
                actionref(ExportImportBookRef; ExportImportBook)
                {

                }
                actionref(ExportImportBookFlatRef; ExportImportBookFlat)
                {

                }
            }
        }

        area(Processing)
        {
            group(Utility)
            {
                action(ExportImportBook)
                {
                    Caption = 'Export/Import Books';
                    Image = ImportExport;

                    RunObject = xmlport "Book Export/Import";
                    ToolTip = 'It exports/imports books';
                }

                action(ExportImportBookFlat)
                {
                    Caption = 'Export/Import Books Flat';
                    Image = ImportExport;

                    RunObject = xmlport "Book Export/Import Flat";
                    ToolTip = 'It exports/imports books in txt format';
                }
            }

            group(Reports)
            {
                Caption = 'Reports';

                action(AvailableBooks)
                {
                    Caption = 'Available Books';
                    Image = Report;

                    RunObject = report "Available Book List";
                    ToolTip = 'It shows list of book with available informations';
                }

                action(AvailableBooksWord)
                {
                    Caption = 'Available Books (Word/Excel)';
                    Image = Report;

                    RunObject = report "Av. Book List (MultiLayout)";
                    ToolTip = 'It shows list of book with available informations for Word/Excel';
                }
            }
        }
    }
}
