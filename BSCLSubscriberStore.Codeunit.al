codeunit 50200 "BSCL Subscriber Store"
{
    var
        OnBeforeDeleteBookErr: Label 'You are not allowed to delete %1 %2 because it is liked by one or more customer(s)';

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", OnBeforeOnDelete, '', false, false)]
    procedure BookOnBeforeDelete(var Rec: Record "BSB Book"; var IsHandled: Boolean)
    var
        Customer: Record Customer;
    begin
        if IsHandled then
            exit;
        // Rec.CalcFields("BSCL No. of Customer Likes");
        // if Rec."BSCL No. of Customer Likes" > 0 then
        //     Error(OnBeforeDeleteBookErr,Rec.TableCaption,Rec."No.");

        Customer.SetCurrentKey("BSB Favorite Book No.");
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(OnBeforeDeleteBookErr, Rec.TableCaption, Rec."No.");
        IsHandled := true;
    end;
}