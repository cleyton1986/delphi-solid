unit IDeliveryPersonRepository;

interface

uses
  IDeliveryPerson,
  System.Generics.Collections;

type
  IDeliveryPersonRepositoryInterface = interface
    ['{5B6D2D1B-60B7-4A76-AFEC-BE70F5CE6C0C}']
    function GetAll: TList<IDeliveryPersonInterface>;
    procedure Add(ADeliveryPerson: IDeliveryPersonInterface);
  end;

implementation

end.

