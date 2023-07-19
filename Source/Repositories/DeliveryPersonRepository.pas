unit DeliveryPersonRepository;

interface

uses
  IDeliveryPersonRepository,
  IDeliveryPerson,
  IDatabaseConnection,
  FirebirdConnection,
  System.Generics.Collections,
  FireDAC.Comp.Client,
  DeliveryPerson;

type
  TDeliveryPersonRepository = class(TInterfacedObject, IDeliveryPersonRepositoryInterface)
  private
    FConnection: TFDConnection;
    FDeliveryPersonList: TObjectList<TDeliveryPerson>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetAll: TList<IDeliveryPersonInterface>;
    procedure Add(ADeliveryPerson: IDeliveryPersonInterface);
  end;

implementation

uses
  System.SysUtils;

constructor TDeliveryPersonRepository.Create;
var
  DatabaseConnection: IDBConnection;
begin
  DatabaseConnection := TFirebirdConnection.Create;
  FConnection := DatabaseConnection.Connection;
   if FConnection = nil then
    raise Exception.Create('A conex�o com o banco de dados n�o foi inicializada');
end;

destructor TDeliveryPersonRepository.Destroy;
begin
  FDeliveryPersonList.Free;
  inherited;
end;

function TDeliveryPersonRepository.GetAll: TList<IDeliveryPersonInterface>;
var
  DeliveryPerson: TDeliveryPerson;
begin
  Result := TList<IDeliveryPersonInterface>.Create;

  for DeliveryPerson in FDeliveryPersonList do
    Result.Add(DeliveryPerson);
end;

procedure TDeliveryPersonRepository.Add(ADeliveryPerson: IDeliveryPersonInterface);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'INSERT INTO DeliveryPerson (NAME, STATUS) VALUES (:NAME, :STATUS)';
    Query.ParamByName('NAME').AsString := ADeliveryPerson.Name;
    Query.ParamByName('STATUS').AsString := ADeliveryPerson.Status;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

end.

