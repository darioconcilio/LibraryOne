namespace LibraryOne.LibraryOne;

using System.Utilities;
using System.Environment;

page 50126 "Book Request Wizard"
{
    ApplicationArea = All;
    Caption = 'Book Request Wizard';
    PageType = NavigatePage;
    SourceTable = "Book Custom Request";

    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(Step1_ChooseItem)
            {
                Caption = 'Choose Item';
                InstructionalText = 'The first thing to do is to choose the reader, the book, and the amount of books to request';
                Visible = Step1_ChooseItemVisible;

                group(Presentation)
                {
                    Caption = 'Welcome to the book customization wizard';

                    group(PresentationInstruction)
                    {
                        Caption = '';
                        InstructionalText = 'You can specify all information about book reader request to customize cover book and additional custom description. Remember, cover service is mandatory, if you want additional print custom description, you just select option, but it''s not mandatory.';
                    }

                }

                group(PrimaryData)
                {
                    Caption = 'Request Information';

                    field("Customer No."; Rec."Book Reader Code")
                    {
                        ApplicationArea = All;
                        InstructionalText = 'Code or Name of book reader';
                        Caption = 'Customer No.';
                        ToolTip = 'You have to choose customer that what request a customization of book';
                    }

                    field("Book Code"; Rec."Book Code")
                    {
                        ApplicationArea = All;
                        InstructionalText = 'Code or Title of Book';
                        Caption = 'Book Code';
                        ToolTip = 'You have to choose book that customer what requests for customizzation';
                    }

                    field(Quantity; Rec.Quantity)
                    {
                        ApplicationArea = All;
                        Caption = 'Quantity';
                        ToolTip = 'You have to specify how much books customer whants';
                    }
                }
            }

            group(Step2_ChooseOptionalCover)
            {
                Caption = 'Optional Cover Configuration';
                InstructionalText = '';
                Visible = Step2_ChooseCoverVisible;

                field("Cover Type"; Rec."Cover Type")
                {
                    ApplicationArea = All;
                    Caption = 'Cover Type';
                    ToolTip = 'You can specify which type of cover must have a book.\It''s an optional request.';

                    trigger OnValidate()
                    begin
                        SelectedCover := Rec."Cover Type" <> "Cover Types"::None;
                    end;
                }

                field("Cover Color"; Rec."Cover Color")
                {
                    ApplicationArea = All;
                    Enabled = SelectedCover;
                    Caption = 'Cover Color';
                    ToolTip = 'If you choose a cover, you have to choose a color of Cover.';
                }
            }

            group(Step3_ChooseOptionalPrint)
            {
                Caption = 'Optional Cover Print';
                InstructionalText = '';
                Visible = Step3_ChooseOptionalPrintVisible;

                field("Print Custom Description"; Rec."Print Custom Description")
                {
                    ApplicationArea = All;

                    Caption = 'Additional print description';
                    ToolTip = 'You can specify additional description printed on book.\It''s an optional request.';

                    trigger OnValidate()
                    begin
                        SelectedOptionalPrint := rec."Print Custom Description";
                    end;
                }

                field("Primary Custom Description"; Rec."Primary Custom Description")
                {
                    ApplicationArea = All;
                    Enabled = SelectedOptionalPrint;
                    InstructionalText = 'Example: schoolboy''s name';
                    Caption = 'Primary Custom Description';
                    ToolTip = 'If you choose a print service, you can specify a description that you want print on a book.\It will print on a first line.';
                }

                field("Secondary Custom Description"; Rec."Secondary Custom Description")
                {
                    ApplicationArea = All;
                    InstructionalText = 'Example: schoolboy''s class';
                    Enabled = SelectedOptionalPrint;
                    Caption = 'Secondary Custom Description';
                    ToolTip = 'If you choose a print service, you can specify a description that you want print on a book.\It will print on a second line.';
                }
            }

            group(Step4_Finish)
            {
                Caption = 'Summary of choices';
                InstructionalText = '';
                Visible = Step4_FinishVisible;

                group(General)
                {
                    Caption = 'Summary';

                    field(BookReaderCode; Rec."Book Reader Code")
                    {
                        Editable = false;
                        ToolTip = 'Book reader code that wants custom book';
                    }

                    field(BookCode; Rec."Book Code")
                    {
                        Editable = false;
                        ToolTip = 'Book code that will be custom';
                    }

                    field(QuantityField; Rec.Quantity)
                    {
                        Editable = false;
                        ToolTip = 'Quantiy books';
                    }
                }

                group(Covering)
                {
                    Caption = 'Covering';
                    Visible = SelectedCover;

                    field(CoverType; Rec."Cover Type")
                    {
                        Editable = false;
                        ToolTip = 'Cover Type';
                        Caption = 'Cover Type';
                    }

                    field(CoverColor; Rec."Cover Color")
                    {
                        Editable = false;
                        ToolTip = 'Color for cover';
                        Caption = 'Color for cover';
                    }
                }

                group(CustomPrint)
                {
                    Caption = 'Custom Printing';
                    Visible = SelectedOptionalPrint;

                    field(PrimaryCustomDescription; Rec."Primary Custom Description")
                    {
                        Editable = false;
                        ToolTip = 'Primary description that will print on cover book';
                    }

                    field(SecondaryCustomDescription; Rec."Secondary Custom Description")
                    {
                        Editable = false;
                        ToolTip = 'Secondary description that will print on cover book';
                    }
                }
            }

            group(StandardBanner)
            {
                Caption = '';
                Editable = false;
                Visible = not Step4_FinishVisible and TopBannerVisible;

                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }

            group(FinishedBanner)
            {
                Caption = '';
                Editable = false;
                Visible = Step4_FinishVisible and TopBannerVisible;

                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Back)
            {
                Enabled = BackEnable;
                InFooterBar = true;
                Image = PreviousRecord;
                ApplicationArea = All;
                Caption = 'Back';

                trigger OnAction()
                begin
                    if Not NextStep(true) then
                        Error(GetLastErrorText());
                end;
            }
            action(Next)
            {
                Enabled = NextEnable;
                InFooterBar = true;
                Image = NextRecord;
                ApplicationArea = All;
                Caption = 'Next';

                trigger OnAction()
                begin
                    if Not NextStep(false) then
                        Error(GetLastErrorText());
                end;
            }
            action(Finish)
            {
                Enabled = FinishEnable;
                InFooterBar = true;
                Image = Approve;
                Caption = 'Confirm';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Finished();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        ProcessStepsStatus();
        LoadTopBanners();
    end;

    trigger OnOpenPage()
    begin
        Rec.Init();
        Rec.Insert();
        CurrPage.Update();
    end;

    var
        //Banner
        MediaRepositoryDone: Record "Media Repository";
        MediaRepositoryStandard: Record "Media Repository";
        MediaResourcesDone: Record "Media Resources";
        MediaResourcesStandard: Record "Media Resources";


        Step1_ChooseItemVisible: Boolean;

        Step2_ChooseCoverVisible: Boolean;
        SelectedCover: Boolean;

        Step3_ChooseOptionalPrintVisible: Boolean;
        SelectedOptionalPrint: Boolean;

        Step4_FinishVisible: Boolean;

        TopBannerVisible: Boolean;

    local procedure ResetControls()
    begin
        FinishEnable := false;
        BackEnable := true;
        NextEnable := true;
        Step1_ChooseItemVisible := false;
        Step2_ChooseCoverVisible := false;
        Step3_ChooseOptionalPrintVisible := false;
        Step4_FinishVisible := false;
    end;

    local procedure LoadTopBanners()
    begin
        if MediaRepositoryStandard.Get('AssistedSetup-NoText-400px.png', Format(CurrentClientType())) and
            MediaRepositoryDone.Get('AssistedSetupDone-NoText-400px.png', Format(CurrentClientType()))
        then
            if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") and
                MediaResourcesDone.Get(MediaRepositoryDone."Media Resources Ref") then
                TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();
    end;

    local procedure ShowStep1_ChooseItem()
    begin
        Step1_ChooseItemVisible := true;
        BackEnable := false;
        NextEnable := true;
        FinishEnable := false;
    end;

    [TryFunction]
    local procedure IsValidStep1_ChooseItem()
    begin
        Rec.TestField("Book Reader Code");
        Rec.TestField("Book Code");
        Rec.TestField(Quantity);
    end;

    local procedure ShowStep2_ChooseOptionalCover()
    begin

        if not IsValidStep1_ChooseItem() then
            if NextStep(true) then //Ba bck
                Error(GetLastErrorText());

        Step2_ChooseCoverVisible := true;
        BackEnable := true;
        NextEnable := true;
        FinishEnable := false;
    end;

    [TryFunction]
    local procedure IsValidStep2_ChooseOptionalCover()
    var
        CoverTypeMandatoryErr: Label 'In this wizard covering service is mandatory';
    begin
        if Rec."Cover Type" = "Cover Types"::None then
            Error(CoverTypeMandatoryErr);
    end;

    local procedure "ShowStep3_ChooseOptionalPrint"()
    begin

        if not IsValidStep2_ChooseOptionalCover() then
            if NextStep(true) then //Back
                Error(GetLastErrorText());

        Step3_ChooseOptionalPrintVisible := true;
        BackEnable := true;
        NextEnable := true;
        FinishEnable := false;
    end;

    [TryFunction]
    local procedure IsValidStep3_ChooseOptionalPrint()
    var
        PrimaryCustomDescriptionErr: Label 'You chose Print custom description service,\but you don''t specify primary description';
    begin
        if Rec."Print Custom Description" and
           (Rec."Primary Custom Description" = '') then
            Error(PrimaryCustomDescriptionErr);

    end;

    local procedure ShowStep4_Finish()
    begin

        if not IsValidStep3_ChooseOptionalPrint() then
            Error(GetLastErrorText());

        Step4_FinishVisible := true;
        BackEnable := true;
        NextEnable := false;
        FinishEnable := true;

    end;

    local procedure ProcessStepsStatus()
    begin
        ResetControls();
        case CurrentStep of
            "Configuration Steps"::Start:
                ShowStep1_ChooseItem();
            "Configuration Steps"::Cover:
                ShowStep2_ChooseOptionalCover();
            "Configuration Steps"::Print:
                ShowStep3_ChooseOptionalPrint();
            "Configuration Steps"::Confirm:
                ShowStep4_Finish();
        end;
    end;

    #region moving_steps

    var
        CurrentStep: enum "Configuration Steps";
        BackEnable: Boolean;
        NextEnable: Boolean;
        FinishEnable: Boolean;
        ConfirmedBookCustomRequest: Boolean;


    /// <summary>
    /// Management for moving between steps
    /// </summary>
    /// <param name="Backwards">It indicates if user want to back step</param>
    [TryFunction]
    local procedure NextStep(Backwards: Boolean)
    var
        CurrentIntegerStep: Integer;
    begin

        CurrentIntegerStep := CurrentStep.AsInteger();

        if Backwards then
            CurrentIntegerStep -= 1
        else
            CurrentIntegerStep += 1;

        CurrentStep := CurrentIntegerStep;

        ProcessStepsStatus();
    end;

    /// <summary>
    /// Execute confirmation of wizard
    /// </summary>
    local procedure Finished()
    begin
        GenerateItemRequest();
        CurrPage.Close();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if ConfirmedBookCustomRequest then
            Page.Run(Page::"Book Request List");
    end;

    local procedure GenerateItemRequest()
    var
        ItemRequestConfigurator: record "Book Custom Request";
    begin

        ItemRequestConfigurator.Init();

        ItemRequestConfigurator.TransferFields(Rec, true);

        ItemRequestConfigurator."Entry No." := 0;
        ItemRequestConfigurator."Request Date" := Today();
        ItemRequestConfigurator.Confirmed := true;

        ItemRequestConfigurator.Insert();

        ConfirmedBookCustomRequest := true;

    end;

    #endregion
}
