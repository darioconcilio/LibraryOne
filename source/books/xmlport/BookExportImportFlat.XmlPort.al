xmlport 50101 "Book Export/Import Flat"
{
    Caption = 'Book Export/Import';
    Format = VariableText;
    FieldSeparator = '<TAB>';
    TextEncoding = MSDOS;
    FieldDelimiter = '<None>';
    TableSeparator = '<CR>';


    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Book; Book)
            {
                RequestFilterFields = "Author Code", "Language Code";

                fieldelement(Code; Book."Code")
                {
                }
                fieldelement(Title; Book.Title)
                {
                }
                fieldelement(LiteraryGenreCode; Book."Literary Genre Code")
                {
                }
                fieldelement(LanguageCode; Book."Language Code")
                {
                }
                fieldelement(ISBN10; Book."ISBN-10")
                {
                }
                fieldelement(ISBN13; Book."ISBN-13")
                {
                }
                fieldelement(Note; Book.Note)
                {
                }
                fieldelement(AuthorCode; Book."Author Code")
                {
                }
            }
        }
    }

}
