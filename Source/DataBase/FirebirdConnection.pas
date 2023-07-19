unit FirebirdConnection;

interface

uses
   FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Comp.Client,
  IDatabaseConnection,
  System.SysUtils;

type
  TFirebirdConnection = class(TInterfacedObject, IDBConnection)
  private
    FConnection: TFDConnection;
    function GetConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    property Connection: TFDConnection read GetConnection;
  end;

implementation

constructor TFirebirdConnection.Create;
begin
  FConnection := TFDConnection.Create(nil);
  // Aqui você define suas configurações de conexão, por exemplo:
  FConnection.DriverName := 'FB';
  FConnection.Params.Values['Database'] := 'D:\Desenvolvimento\__CLIENTES__\Testes\ProjetoSOLID\DB\database.fdb';
  FConnection.Params.Values['User_Name'] := 'SYSDBA';
  FConnection.Params.Values['Password'] := 'masterkey';
  FConnection.Params.Values['Protocol'] := 'TCPIP';
  FConnection.Params.Values['Server'] := 'localhost';
  FConnection.Connected := true;
end;

destructor TFirebirdConnection.Destroy;
begin
  FConnection.Free;
  inherited;
end;

function TFirebirdConnection.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

end.

