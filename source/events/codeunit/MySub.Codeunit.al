codeunit 50149 MySub
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnAfterManualReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnAfterManualReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        CalcDueDateTxt: Label '<1M>', Locked = true;
    begin

        if not PreviewMode then
            SalesHeader."Operational Due Date" := CalcDate(CalcDueDateTxt, Today);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post", OnCodeOnBeforeConfirmPostJournalLinesResponse, '', false, false)]
    local procedure "Gen. Jnl.-Post_OnCodeOnBeforeConfirmPostJournalLinesResponse"(var GenJournalLine: Record "Gen. Journal Line"; var IsHandled: Boolean)
    begin

        IsHandled := true;

        //WARNING Evito di chiedere la conferma dello standard !!!

    end;




}