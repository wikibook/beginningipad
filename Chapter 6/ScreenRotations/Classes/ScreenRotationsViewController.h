//
//  ScreenRotationsViewController.h
//  ScreenRotations
//
//  Created by Wei-Meng Lee on 2/28/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenRotationsViewController : UIViewController {
	IBOutlet UIButton *btn;	
}

@property (nonatomic, retain) UIButton *btn;

-(IBAction) btnClicked: (id) sender;

@end

