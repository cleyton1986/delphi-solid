unit UnitMain;

interface

uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DeliveryModule,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TFormMain = class(TForm)
    EditID: TEdit;
    EditNome: TEdit;
    EditStatus: TEdit;
    ButtonAdd: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    ButtonSelect: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonSelectClick(Sender: TObject);

  private
    { Private declarations }
     FDeliveryModule: TDeliveryModule;
  public
    { Public declarations }

    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses FirebirdConnection;

procedure TFormMain.ButtonAddClick(Sender: TObject);
var
  ID: Integer;
  Name, Status: string;
begin
  ID := StrToInt(EditID.Text);
  Name := EditNome.Text;
  Status := EditStatus.Text;
  FDeliveryModule.Add(ID, Name, Status);

end;

procedure TFormMain.ButtonSelectClick(Sender: TObject);
var
  Query: TFDQuery;
  Conn: TFirebirdConnection;
  DataSource: TDataSource;
begin
  Conn   :=  TFirebirdConnection.Create;

  // Criar e configurar a query
  Query := TFDQuery.Create(Self);

  Query.Connection :=   Conn.Connection;
  Query.SQL.Text := 'SELECT * FROM DeliveryPerson';

  // Criar e configurar o data source
  DataSource := TDataSource.Create(Self);
  DataSource.DataSet := Query;

  // Vincular o data source ao grid
  DBGrid1.DataSource := DataSource;

  // Executar a query
  Query.Open;
end;

constructor TFormMain.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TFormMain.Destroy;
begin

  inherited;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  inherited;
  FDeliveryModule := TDeliveryModule.Create;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
   FDeliveryModule.Free;
  inherited;
end;

end.
