namespace LibraryOne.Mapping;

page 50118 "Mapping Card"
{
    ApplicationArea = All;
    Caption = 'Mapping Card';
    PageType = Document;
    SourceTable = "Mapping Header";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Table Id"; Rec."Table Id")
                {
                    ToolTip = 'Specifies the value of the Table Id field.';
                }
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Table Name field.';
                }
            }

            part("Mapping Lines"; "Mapping Lines")
            {
                ApplicationArea = Basic, Suite;
                Editable = true;
                Enabled = true;
                SubPageLink = "Table Id" = field("Table Id");
                UpdatePropagation = Both;
            }
        }
    }
}
