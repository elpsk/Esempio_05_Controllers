//
//  NavBar.m
//  A
//
//  Created by Alberto Pasca on 31/10/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "NavBar.h"

@implementation NavBar
@synthesize NavController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self.view addSubview:NavController.view];
  }
  return self;
}

- (IBAction)CancelTouched:(id)sender {
  [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)NextTouched:(id)sender {
  UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
  aView.backgroundColor = [UIColor redColor];
  
  UIViewController *vc = [[UIViewController alloc] init];
  vc.view = aView;
  [NavController pushViewController:vc animated:YES];

  [aView release];
  [vc release];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewDidUnload {
  [NavController release]; NavController = nil;
  
  [self setNavController:nil];
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
  [NavController release];
  [super dealloc];
}
@end
