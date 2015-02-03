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
    _realmFilename:String;
  protected
  public
    method init: instancetype; override;
    method windowDidLoad; override;
    
    [IBAction] method doStuffWithRealm(sender:id);
    [IBAction] method doRealmSearch(sender:id);
  end;

implementation

method MainWindowController.init: instancetype;
begin
  self := inherited initWithWindowNibName('MainWindowController');
  if assigned(self) then 
  begin

    // Custom initialization
    self._realmFilename := '/Users/JohnMoshakis/Documents/some.realm';

  end;
  result := self;
end;

method MainWindowController.windowDidLoad;
begin
  inherited windowDidLoad();

  // Implement this method to handle any initialization after your window controller's
  // window has been loaded from its nib file.
  

end;

method MainWindowController.doRealmSearch(sender: id);
begin
  var realm := RLMRealm.realmWithPath(_realmFilename);
  
  var allEmployees := Employee.allObjectsInRealm(realm);
  if(assigned(allEmployees))then
  begin
    NSLog('Found employees');
    
    for x:Integer := 0 to allEmployees.Count do
    begin
      var employee := allEmployees.objectAtIndex(x) as Employee;
      NSLog(employee.Name);
    end;
  end;
end;

method MainWindowController.doStuffWithRealm(sender: id);
begin

  //_realm := RLMRealm.inMemoryRealmWithIdentifier('John');
  //~/Application Support/{bundle ID}/default.realm on OS X.
  
  NSLog('%@',RLMRealm.defaultRealmPath);

  //var realm := RLMRealm.defaultRealm;
  var realm := RLMRealm.realmWithPath(_realmFilename);
  
  realm.beginWriteTransaction;
  
  var employee := new Employee;
  employee.Name := 'John Smith';
  
  realm.addObject(employee);
  
  realm.commitWriteTransaction;
end;

end.
