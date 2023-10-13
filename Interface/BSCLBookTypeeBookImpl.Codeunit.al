codeunit 50240 "BSCL Book Type eBook Impl." implements "BSB Book Type Interface"
{
    procedure StartDeploymentBook();
    begin
        Message('PDF auf Portal geladen');
    end;

    procedure StartDeliverBook();
    begin
        Message('Besteller bekommt E-Mail');
    end;
}