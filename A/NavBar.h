//
//  NavBar.h
//  A
//
//  Created by Alberto Pasca on 31/10/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavBar : UIViewController {
  UINavigationController *NavController;
}

@property (retain, nonatomic) IBOutlet UINavigationController *NavController;

- (IBAction)CancelTouched:(id)sender;
- (IBAction)NextTouched:(id)sender;

@end
