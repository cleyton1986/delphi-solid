unit IDeliveryPerson;

interface

type
  IDeliveryPersonInterface = interface
    ['{3B651628-2E6C-4751-9A89-BCD1A3DD1FBE}']
    function GetID: Integer;
    procedure SetID(const Value: Integer);
    function GetName: string;
    procedure SetName(const Value: string);
    function GetStatus: string;
    procedure SetStatus(const Value: string);

    property ID: Integer read GetID write SetID;
    property Name: string read GetName write SetName;
    property Status: string read GetStatus write SetStatus;
  end;

implementation

end.

