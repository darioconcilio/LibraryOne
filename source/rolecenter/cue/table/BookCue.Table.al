namespace LibraryOne.RoleCenter.Cue;

using LibraryOne.Posting;

table 50110 "Book Cue"
{
    Caption = 'Book Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Books on Loan"; Integer)
        {
            CalcFormula = count("Book Loan Entry" where("Entry Type" = const(Loan),
                                                        Returned = const(false)));
            Caption = 'Book on Loan';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Overdue loan Books"; Integer)
        {
            CalcFormula = count("Book Loan Entry" where("Entry Type" = const(Loan),
                                                        Returned = const(false),
                                                        "Due Date" = field("Date Filter")));
            Caption = 'Overdue loan Books';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}
