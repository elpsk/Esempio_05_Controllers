//
//  Table.h
//  A
//
//  Created by Alberto Pasca on 31/10/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Table : UIViewController <UITableViewDataSource, UITableViewDelegate> {
  
  IBOutlet UITableView *Tabella;
  NSMutableArray *TableValues;
  
}

@property (nonatomic, retain) UITableView *Tabella;
@property (retain, nonatomic) IBOutlet UITableViewCell *CellaCustom;

- (IBAction) CloseMe:(id)sender;
- (IBAction)EditTable:(id)sender;

@end
