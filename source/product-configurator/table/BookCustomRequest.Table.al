table 50116 "Book Custom Request"
{
    Caption = 'Book Custom Request';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Request Date"; Date)
        {
            Caption = 'Request Date';
        }
        field(3; "Book Reader Code"; Code[20])
        {
            Caption = 'Book Reader Code';
            TableRelation = "Book Reader";
        }
        field(4; "Book Code"; Code[20])
        {
            Caption = 'Book Code';
            TableRelation = Book;
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(6; "Cover Type"; enum "Cover Types")
        {
            Caption = 'Cover Type';
        }
        field(7; "Cover Color"; enum "Cover Colors")
        {
            Caption = 'Cover Color';
        }
        field(8; "Print Custom Description"; Boolean)
        {
            Caption = 'Print Custom Description';
        }
        field(10; "Primary Custom Description"; Text[100])
        {
            Caption = 'Primary Custom Description';
        }
        field(11; "Secondary Custom Description"; Text[100])
        {
            Caption = 'Secondary Custom Description';
        }
        field(12; Confirmed; Boolean)
        {
            Caption = 'Confirmed';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
