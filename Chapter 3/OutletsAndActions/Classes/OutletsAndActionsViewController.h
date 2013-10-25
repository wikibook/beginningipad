//
//  OutletsAndActionsViewController.h
//  OutletsAndActions
//
//  Created by Wei-Meng Lee on 3/15/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OutletsAndActionsViewController : UIViewController {
    //---declaring the outlet---
    IBOutlet UITextField *txtName;
}

//---expose the outlet as a property---
@property (nonatomic, retain) UITextField *txtName;

//---declaring the action---
-(IBAction) btnClicked: (id) sender;

@end

