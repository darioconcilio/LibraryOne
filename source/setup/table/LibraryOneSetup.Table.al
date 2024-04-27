namespace LibraryOne.Setup;

table 50105 "Library One Setup"
{
    Caption = 'Library One Setup';
    DrillDownPageID = "Library One Setup";
    LookupPageId = "Library One Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Due Days"; DateFormula)
        {
            Caption = 'Due Days';
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
