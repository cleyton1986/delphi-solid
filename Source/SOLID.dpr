program SOLID;

uses
  Vcl.Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  FirebirdConnection in 'DataBase\FirebirdConnection.pas',
  IDeliveryPerson in 'Interfaces\IDeliveryPerson.pas',
  DeliveryPerson in 'Models\DeliveryPerson.pas',
  IDeliveryPersonRepository in 'Interfaces\IDeliveryPersonRepository.pas',
  DeliveryPersonRepository in 'Repositories\DeliveryPersonRepository.pas',
  DeliveryModule in 'Modules\DeliveryModule.pas',
  IDatabaseConnection in 'Interfaces\IDatabaseConnection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
