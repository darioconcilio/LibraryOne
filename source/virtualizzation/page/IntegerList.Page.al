namespace LibraryOne.Virtualization;

using System.Utilities;

page 50122 "Integer List"
{
    ApplicationArea = All;
    Caption = 'Integer List';
    PageType = List;
    SourceTable = "Integer";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'virtual,table,integer';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Number; Rec.Number)
                {
                    ToolTip = 'Specifies the Excel row number.';
                }
            }
        }
    }
}
