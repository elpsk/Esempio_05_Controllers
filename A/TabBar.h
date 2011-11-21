//
//  TabBar.h
//  A
//
//  Created by Alberto Pasca on 31/10/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBar : UIViewController {
  UITabBarController *tbc;
}

@property (retain, nonatomic) IBOutlet UITabBarController *tbc;

- (IBAction)CloseMeTouched:(id)sender;

@end
