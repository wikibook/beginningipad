//
//  MultiTouchAppDelegate.h
//  MultiTouch
//
//  Created by Wei-Meng Lee on 2/20/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MultiTouchViewController;

@interface MultiTouchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MultiTouchViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MultiTouchViewController *viewController;

@end

