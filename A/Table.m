//
//  Table.m
//  A
//
//  Created by Alberto Pasca on 31/10/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "Table.h"

@implementation Table
@synthesize Tabella;
@synthesize CellaCustom;

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];

  Tabella.delegate = self;
  Tabella.dataSource = self;
  
  TableValues = [[NSMutableArray alloc] initWithObjects:@"alberto", @"luca", @"giovanni", @"andrea", @"stefano", nil];
  [Tabella reloadData];
}

- (void)viewDidUnload {
  [self setCellaCustom:nil];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 3) return 70;
  return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (section == 0)  return [TableValues count];
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    cell.textLabel.text = [TableValues objectAtIndex:indexPath.row];
  }
  
  if (indexPath.section == 1) {
    cell = CellaCustom;
  }
  
  return cell;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 3) return NO;
  return YES;
}

- (BOOL) tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath { return YES; }

- (void) tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath { }

- (void) tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath { }

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
  return UITableViewCellEditingStyleDelete;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath { }

- (NSIndexPath *) tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath {
  return sourceIndexPath;
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath { }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row != 3) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test Alert" 
                                                    message:[TableValues objectAtIndex:indexPath.row] 
                                                   delegate:self 
                                          cancelButtonTitle:@"Ok" otherButtonTitles:@"Si", @"No", nil];
    [alert show];
    [alert release];
  }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  NSLog(@"%s, %d", __FUNCTION__, buttonIndex);
}


- (IBAction) CloseMe:(id)sender {
//  [self dismissModalViewControllerAnimated:YES];
  
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:1.0];
  [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
  [self.view removeFromSuperview];
  [UIView commitAnimations];

}

- (IBAction) EditTable:(id)sender {
  
  UIBarButtonItem *btn = (UIBarButtonItem*)sender;
  if ( [btn.title isEqualToString:@"EDIT"] ) {
    Tabella.editing = YES;
    btn.title = @"OK";
  } else {
    Tabella.editing = NO;    
    btn.title = @"EDIT";
  }
  
}

- (void)dealloc {
  [CellaCustom release];
  [super dealloc];
}
@end







