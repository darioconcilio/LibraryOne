namespace LibraryOne.Experimental.Temporary;

page 50123 "Buffer Data Entry"
{
    ApplicationArea = All;
    Caption = 'Buffer Data Entry';
    PageType = List;
    SourceTable = "Buffer Data";
    UsageCategory = Tasks;

    AdditionalSearchTerms = 'buffer,data,temporary';

    SourceTableTemporary = true;

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
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Test)
            {
                action(TestPost)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Test Post';
                    Image = TestReport;
                    ToolTip = 'Test posting buffer data';

                    trigger OnAction()
                    var
                        BufferDataMngt: Codeunit "Buffer Data Management";
                    begin
                        BufferDataMngt.Post(Rec);
                    end;
                }

                action(TestPostWithbar)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Test Post With Bar';
                    Image = BarChart;
                    ToolTip = 'Test posting buffer data with bar';

                    trigger OnAction()
                    var
                        BufferDataMngt: Codeunit "Buffer Data Management";
                    begin
                        BufferDataMngt.PostWithProgress(Rec);
                    end;
                }
            }
        }
    }
}
