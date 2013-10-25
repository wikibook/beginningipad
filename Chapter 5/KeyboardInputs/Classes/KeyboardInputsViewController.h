//
//  KeyboardInputsViewController.h
//  KeyboardInputs
//
//  Created by Wei-Meng Lee on 3/6/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardInputsViewController : UIViewController {
    IBOutlet UITextField *textField;
}

@property (nonatomic, retain) UITextField *textField;

-(IBAction) doneEditing:(id) sender;
-(IBAction) bgTouched:(id) sender;

@end

