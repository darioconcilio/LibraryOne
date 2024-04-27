namespace LibraryOne.Experimental.Temporary;

codeunit 50106 "Buffer Data Management"
{
    procedure Post(var RefTempBufferData: Record "Buffer Data" temporary)
    var
        WinProgressLbl: Label 'Process #1 of #2\Code: #4\Name: #5\Process: #3', Comment = '#1 = current index;#2 = total indexes;#3 = fake timing process;#4 = Code of record;#5 = Name of record';
        WinDialog: Dialog;
        TotalIndexes: Integer;
        CurrentIndex: Integer;
        Index: Integer;
    begin

        if GuiAllowed then
            WinDialog.Open(WinProgressLbl);

        if RefTempBufferData.FindSet() then begin

            TotalIndexes := RefTempBufferData.Count;

            repeat

                if GuiAllowed then begin
                    WinDialog.Update(4, RefTempBufferData.Code);
                    WinDialog.Update(5, RefTempBufferData.Name);
                end;

                // >> Fake
                For Index := 0 to 5 do begin

                    System.Sleep(75);

                    if GuiAllowed then
                        WinDialog.Update(3, Index);
                end;
                // << Fake

                CurrentIndex += 1;

                if GuiAllowed then begin
                    WinDialog.Update(1, CurrentIndex);
                    WinDialog.Update(2, TotalIndexes);
                end;

            until RefTempBufferData.Next() = 0;
        end;

        if GuiAllowed then
            WinDialog.Close();

    end;

    procedure PostWithProgress(var RefTempBufferData: Record "Buffer Data" temporary)
    var
        WinProgressLbl: Label 'Process #1', Comment = '#1 = Progress bar';
        WinDialog: Dialog;
        TotalIndexes: Integer;
        CurrentIndex: Integer;
        ProgressIndex: Integer;
        DoneLbl: Label 'Done! Posted #1 items', Comment = '#1 = Number of items processed';
    begin

        CurrentIndex := 0;

        if GuiAllowed then
            WinDialog.Open(WinProgressLbl);

        if RefTempBufferData.FindSet() then begin

            TotalIndexes := RefTempBufferData.Count;

            repeat

                System.Sleep(75);
                CurrentIndex += 1;

                //Proporzione >> CurrentIndex : TotalIndexes = X : 26
                ProgressIndex := round((CurrentIndex * 26) / TotalIndexes, 1);
                WinDialog.Update(1, Text.PadStr('', ProgressIndex, '|').PadRight(26, '-'));

            until RefTempBufferData.Next() = 0;
        end;

        if GuiAllowed then begin
            WinDialog.Close();
            Message(DoneLbl, CurrentIndex);
        end;

    end;
}
