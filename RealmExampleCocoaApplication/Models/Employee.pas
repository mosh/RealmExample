namespace RealmExampleCocoaApplication.Models;

interface

uses
  Realm.*,
  Foundation;
  
type

  Employee = public class(RLMObject)
  public
    property Firstname:String;
    property Lastname:String;
  end;

implementation

end.
