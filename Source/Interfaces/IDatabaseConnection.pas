unit IDatabaseConnection;

interface

uses
  FireDAC.Comp.Client;

type
  IDBConnection = interface
    ['{874A9B08-5AAB-4EFE-BDD6-A12A4137671C}']
    function GetConnection: TFDConnection;
    property Connection: TFDConnection read GetConnection;
  end;

implementation

end.

