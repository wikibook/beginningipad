//
//  ScrollingViewsViewController.h
//  ScrollingViews
//
//  Created by Wei-Meng Lee on 3/7/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollingViewsViewController : UIViewController 
<UITextFieldDelegate> {
    IBOutlet UIScrollView *scrollView;
	IBOutlet UITextField *textField;
	
	UITextField *currTextField;
}

@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIScrollView *scrollView;

@end

