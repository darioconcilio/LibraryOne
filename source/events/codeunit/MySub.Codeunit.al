codeunit 50149 MySub
{
    /*[EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterManualReleaseSalesDoc', '', true, true)]
    local procedure OnAfterManualReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    begin

    end;*/

    /*[EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforePerformManualReleaseProcedure, '', false, false)]
    local procedure "Release Sales Document_OnBeforePerformManualReleaseProcedure"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    begin
        IsHandled := true;

        //Gestire con nuova procedura
    end;*/


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnAfterManualReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnAfterManualReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        CalculationTxt: Label '<1M>', Locked = true;
    begin
        if SalesHeader.Status = Enum::"Sales Document Status"::Released then
            SalesHeader."Operational Due Date" := CalcDate(CalculationTxt, Today);
    end;

}