//
//  ViewController.h
//  A
//
//  Created by Alberto Pasca on 31/10/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate> {
  
  IBOutlet UITextField *MyTextField;
  IBOutlet UIWebView *WebView;
  
}

- (IBAction) NavTouched:(id)sender;
- (IBAction) TabTouched:(id)sender;
- (IBAction) TableTouched:(id)sender;

@end
