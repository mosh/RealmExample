namespace RealmiOSApplication;

interface

uses
  UIKit;

type
  [IBObject]
  FlipsideViewController = public class(UIViewController)
  private
  public

    method awakeFromNib; override;
    method viewDidLoad; override;
    method didReceiveMemoryWarning; override;

    [IBAction] method done(aSender: id);
    [IBOutlet] property &delegate: weak IFlipsideViewControllerDelegate;
  end;

  IFlipsideViewControllerDelegate = public interface
    method flipsideViewControllerDidFinish(controller: FlipsideViewController);
  end;

implementation


method FlipsideViewController.awakeFromNib;
begin
  preferredContentSize := CGSizeMake(320.0, 480.0);
  inherited awakeFromNib;
end;

method FlipsideViewController.viewDidLoad;
begin
  inherited viewDidLoad;

  // Do any additional setup after loading the view.
end;

method FlipsideViewController.didReceiveMemoryWarning;
begin
  inherited didReceiveMemoryWarning;

  // Dispose of any resources that can be recreated.
end;

method FlipsideViewController.done(aSender: id);
begin
  &delegate:flipsideViewControllerDidFinish(self);
end;

end.
