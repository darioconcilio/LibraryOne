namespace LibraryOne.RoleCenter;

using LibraryOne.Books;
using LibraryOne.LibraryOne;
using LibraryOne.Posting;
using LibraryOne.Setup;
using LibraryOne.RoleCenter.Cue;
using LibraryOne.Mapping;

page 50111 "Librarian Role Center"
{
    ApplicationArea = All;
    Caption = 'Librarian Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part("Book Cue"; "Book Cue")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(registries)
            {
                Caption = 'Registries';

                group(library)
                {
                    Caption = 'Library';

                    action(Authors)
                    {
                        ApplicationArea = All;
                        Caption = 'Authors';

                        RunObject = page "Author List";
                        ToolTip = 'Shows author list';
                    }

                    action(Editors)
                    {
                        ApplicationArea = All;
                        Caption = 'Editors';

                        RunObject = page "Editor List";
                        ToolTip = 'Shows editor list';
                    }

                    action(Books)
                    {
                        ApplicationArea = All;
                        Caption = 'Books';

                        RunObject = page "Book List";
                        ToolTip = 'Shows book list';
                    }
                }

                action(BookReaders)
                {
                    ApplicationArea = All;
                    Caption = 'Book Readers';

                    RunObject = page "Book Reader List";
                    ToolTip = 'Shows boo reader list';
                }

                action(Setup)
                {
                    ApplicationArea = All;
                    Caption = 'Library One Setup';

                    RunObject = page "Library One Setup";
                    ToolTip = 'Setup of Library One';
                }
            }

            group(management)
            {
                Caption = 'Management';

                action(BookJournal)
                {
                    ApplicationArea = All;
                    Caption = 'Book Journal';

                    RunObject = page "Book Journal";
                    ToolTip = 'Post book journals';
                }

                action(BookLoanEntries)
                {
                    ApplicationArea = All;
                    Caption = 'Book Loan Entries';

                    RunObject = page "Book Loan Entry";
                    ToolTip = 'Book loan entries';
                }

                group(setupBatch)
                {
                    Caption = 'Setup';

                    action(BookJournalBatches)
                    {
                        ApplicationArea = All;
                        Caption = 'Book Journal batchaes';

                        RunObject = page "Book Journal Batches";
                        ToolTip = 'Book Journal Batches List';
                    }

                    action(BookJournalTemplates)
                    {
                        ApplicationArea = All;
                        Caption = 'Book Journal Templates';

                        RunObject = page "Book Journal Template List";
                        ToolTip = 'Book Journal Template List';
                    }
                }
            }

            group(adminitration)
            {
                Caption = 'Administration';

                action(MappingFiedls)
                {
                    ApplicationArea = All;
                    Caption = 'Mapping Fields';

                    RunObject = page "Mapping Card";
                    ToolTip = 'Setup mapping field to extract data';
                }

                action(Buffer)
                {
                    ApplicationArea = All;
                    Caption = 'Buffer Table';

                    RunObject = page "Buffer Table";
                    ToolTip = 'Generate a buffer table by mapping';
                }
            }

        }

        area(Creation)
        {
            action(NewAuthor)
            {
                ApplicationArea = All;
                Caption = 'Author';

                RunObject = page "Author Card";
                RunPageMode = Create;
                ToolTip = 'Creates new author';
            }

            action(NewEditor)
            {
                ApplicationArea = All;
                Caption = 'Editor';

                RunObject = page "Editor Card";
                ToolTip = 'Creates new editor';
            }

            action(NewBook)
            {
                ApplicationArea = All;
                Caption = 'Book';

                RunObject = page "Book Card";
                ToolTip = 'Creates new book';
            }

            action(NewBookReader)
            {
                ApplicationArea = All;
                Caption = 'Book Reader';

                RunObject = page "Book Reader Card";
                ToolTip = 'Creates new book reader';
            }

            action(NewBookCustomRequest)
            {
                ApplicationArea = All;
                Caption = 'Book Custom Request';

                RunObject = page "Book Request Wizard";
                ToolTip = 'Creates new book request configuration';
            }
        }
    }
}
