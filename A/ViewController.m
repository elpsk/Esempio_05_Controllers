//
//  ViewController.m
//  A
//
//  Created by Alberto Pasca on 31/10/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "ViewController.h"

#import "Table.h"
#import "NavBar.h"
#import "TabBar.h"

@implementation ViewController

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  MyTextField.delegate = self;
  WebView.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)viewDidUnload {
  [MyTextField release];
  MyTextField = nil;
  [WebView release];
  WebView = nil;
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)NavTouched:(id)sender {
  NavBar *n = [[NavBar alloc] initWithNibName:@"NavBar" bundle:nil];
  [self presentModalViewController:n animated:YES];
  [n release];  
}

- (IBAction)TabTouched:(id)sender {
  TabBar *tb = [[TabBar alloc] initWithNibName:@"TabBar" bundle:nil];
  [self presentModalViewController:tb animated:YES];  
  [tb release];
}

- (IBAction)TableTouched:(id)sender {
  
  Table *t = [[[Table alloc] initWithNibName:@"Table" bundle:nil] autorelease];

//  [UIView beginAnimations:nil context:nil];
//  [UIView setAnimationDuration:1.0];
//  [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
//  [self.view addSubview:t.view];
//  [UIView commitAnimations];

[self presentModalViewController:t animated:YES];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
  
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
  
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  
  [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:textField.text]]];
   
  return YES;
}



- (void)dealloc {
  [MyTextField release];
  [WebView release];
  [super dealloc];
}
@end





