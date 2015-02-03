namespace RealmExampleCocoaApplication.Models;

interface

uses
  Realm.*,
  Foundation;
  
type

  Employee = public class(RLMObject)
  public
    property Name:NSString;
  end;

implementation

end.
