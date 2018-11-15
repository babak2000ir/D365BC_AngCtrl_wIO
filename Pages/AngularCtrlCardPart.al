page 50103 AngularCtrlCardPart
{
    PageType = CardPart;
    SourceTable = Customer;
    Caption = 'Angular Control';

    layout
    {
        area(content)
        {
            usercontrol(Ctrl; AngularCtrl)
            {
                ApplicationArea = All;

                trigger ControlAddInReady()
                begin
                    blnAddInIsReady := true;
                    currpage.Ctrl.InitiEventCycle();
                    GetCustomer();

                    //CurrPage.Ctrl.LoadAngularScripts();
                end;

                trigger ShowMessage(ptxtMsg: Text)
                begin
                    Message(ptxtMsg);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        GetCustomer();
    end;

    procedure GetCustomer();
    var
        lrrRecRef: RecordRef;
        ltxtResult: Text;
    begin
        if blnAddInIsReady then begin
            lrrRecRef.GetTable(Rec);
            //fctSerializeRecord(lrrRecRef).WriteTo(ltxtResult);
            ltxtResult := fctSerializeRecord(lrrRecRef);
            currpage.Ctrl.GetCustomer(ltxtResult);
        end;
    end;

    local procedure fctSerializeRecord(prrRecordRef: RecordRef): Text
    var
        lintFieldCount: Integer;
        lintCounter: Integer;
        //lJsonObj: JsonObject;
        ltxtKey: text;
        ltxtValue: text;
        ltxtResult: Text;
    begin
        lintFieldCount := prrRecordRef.FieldCount();
        for lintCounter := 1 to lintFieldCount do begin
            ltxtKey := Format(prrRecordRef.FieldIndex(lintCounter).Name());
            ltxtValue := Format(prrRecordRef.FieldIndex(lintCounter).Value());
            //lJsonObj.Add(ltxtKey, ltxtValue);
            if ltxtResult = '' then
                ltxtResult := '{"FieldName":"' + ltxtKey + '","FieldValue":"' + ltxtValue + '"}'
            else
                ltxtResult := ltxtResult + ',{"FieldName":"' + ltxtKey + '","FieldValue":"' + ltxtValue + '"}';
        end;

        exit('[' + ltxtResult + ']');

    end;

    var
        blnAddInIsReady: Boolean;


}