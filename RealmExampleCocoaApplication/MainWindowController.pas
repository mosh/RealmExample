namespace RealmExampleCocoaApplication;

interface

uses
  RealmExampleCocoaApplication.Models,
  Realm.*,
  AppKit,
  Foundation;

type
  [IBObject]
  MainWindowController = public class(NSWindowController)
  private
    _realm:RLMRealm;
  protected
  public
    method init: instancetype; override;
    method windowDidLoad; override;
    
    [IBAction] method doStuffWithRealm(sender:id);
  end;

implementation

method MainWindowController.init: instancetype;
begin
  self := inherited initWithWindowNibName('MainWindowController');
  if assigned(self) then 
  begin

    // Custom initialization

  end;
  result := self;
end;

method MainWindowController.windowDidLoad;
begin
  inherited windowDidLoad();

  // Implement this method to handle any initialization after your window controller's
  // window has been loaded from its nib file.
  

end;

method MainWindowController.doStuffWithRealm(sender: id);
begin

  //_realm := RLMRealm.inMemoryRealmWithIdentifier('John');
  //~/Application Support/{bundle ID}/default.realm on OS X.
  
  NSLog('%@',RLMRealm.defaultRealmPath);

  var realm := RLMRealm.defaultRealm;
  
  realm.beginWriteTransaction;
  
  var employee := new Employee;
  employee.Firstname := 'John';
  employee.Lastname := 'Smith';
  
  realm.addObject(employee);
  
  realm.commitWriteTransaction;
end;

end.
