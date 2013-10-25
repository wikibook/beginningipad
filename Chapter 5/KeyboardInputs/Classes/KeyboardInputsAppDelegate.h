//
//  KeyboardInputsAppDelegate.h
//  KeyboardInputs
//
//  Created by Wei-Meng Lee on 3/6/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeyboardInputsViewController;

@interface KeyboardInputsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    KeyboardInputsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet KeyboardInputsViewController *viewController;

@end

