//
//  ShakeViewController.h
//  Shake
//
//  Created by Wei-Meng Lee on 3/6/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShakeViewController : UIViewController {
    IBOutlet UITextField *textField;
    IBOutlet UIDatePicker *datePicker;
}

@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIDatePicker *datePicker;

-(IBAction) doneEditing: (id) sender;


@end

