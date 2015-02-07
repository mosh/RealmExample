namespace RealmiOSApplication;

interface

uses
  RealmExample.Core.Models,
  Realm.*,
  UIKit;

type
  [IBObject]
  MainViewController = public class(UIViewController, IUIPopoverControllerDelegate, IFlipsideViewControllerDelegate)
  private
    {$REGION IUIPopoverControllerDelegate}
    method popoverControllerShouldDismissPopover(aPopoverController: UIPopoverController): Boolean;
    method popoverControllerDidDismissPopover(aPopoverController: UIPopoverController);
    {$ENDREGION}
    {$REGION IFlipsideViewControllerDelegate}
    method flipsideViewControllerDidFinish(aController: FlipsideViewController);
    {$ENDREGION}

  public
    method viewDidLoad; override;
    method didReceiveMemoryWarning; override;
    method prepareForSegue(aSegue: UIStoryboardSegue) sender(aSender: id); override;

    [IBAction] method togglePopover(aSender: id);
    [IBOutlet] property flipsidePopoverController: UIPopoverController;
    [IBAction] method doAdd(sender:id);
    [IBAction] method doStuff(sender:id);
  end;

implementation

method MainViewController.viewDidLoad;
begin
  inherited viewDidLoad;

  // Do any additional setup after loading the view.
  NSLog('%@',RLMRealm.defaultRealmPath);

end;

method MainViewController.didReceiveMemoryWarning;
begin
  inherited didReceiveMemoryWarning;

  // Dispose of any resources that can be recreated.
end;

{$REGION IUIPopoverControllerDelegate}
method MainViewController.popoverControllerShouldDismissPopover(aPopoverController: UIPopoverController):Boolean;
begin
end;

method MainViewController.popoverControllerDidDismissPopover(aPopoverController: UIPopoverController);
begin
  flipsidePopoverController := nil;
end;
{$ENDREGION}

{$REGION IFlipsideViewControllerDelegate}
method MainViewController.flipsideViewControllerDidFinish(aController: FlipsideViewController);
begin
  if UIDevice.currentDevice.userInterfaceIdiom = UIUserInterfaceIdiom.UIUserInterfaceIdiomPhone then begin
    dismissViewControllerAnimated(true) completion(nil);
  end
  else begin
    flipsidePopoverController.dismissPopoverAnimated(true);
    flipsidePopoverController := nil;
  end;
end;
{$ENDREGION}

method MainViewController.prepareForSegue(aSegue: UIStoryboardSegue) sender(aSender: id);
begin
  if aSegue.identifier.isEqualToString('showAlternate') then begin

    aSegue.destinationViewController.delegate := self;
    if UIDevice.currentDevice.userInterfaceIdiom = UIUserInterfaceIdiom.UIUserInterfaceIdiomPad then begin
      var lPopoverController := (aSegue as UIStoryboardPopoverSegue).popoverController;
      flipsidePopoverController := lPopoverController;
      lPopoverController.delegate := self;
    end;
  end;
end;

method MainViewController.togglePopover(aSender: id);
begin
  if assigned(flipsidePopoverController) then begin
    flipsidePopoverController.dismissPopoverAnimated(true);
    flipsidePopoverController := nil;
  end
  else begin
    performSegueWithIdentifier('showAlternate') sender(aSender);
  end;
end;

method MainViewController.doAdd(sender: id);
begin

  var realm := RLMRealm.defaultRealm ;
  
  realm.beginWriteTransaction;
  
  var employee := new Employee;
  employee.Name := 'John Smith';
  
  realm.addObject(employee);
  
  realm.commitWriteTransaction;
  
  NSLog('Added employee');
end;

method MainViewController.doStuff(sender: id);
begin
  var realm := RLMRealm.defaultRealm;
  
  var allEmployees := Employee.allObjectsInRealm(realm);
  if(assigned(allEmployees))then
  begin
    NSLog('Found employees');
    
    for x:Integer := 0 to allEmployees.count-1 do
    begin
      var employee := allEmployees.objectAtIndex(x) as Employee;
      NSLog('%@',employee.Name);
    end;
  end
  else
  begin
    NSLog('No Employees');
  end;
end;

end.
