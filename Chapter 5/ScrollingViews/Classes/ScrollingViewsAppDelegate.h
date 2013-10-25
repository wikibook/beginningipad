//
//  ScrollingViewsAppDelegate.h
//  ScrollingViews
//
//  Created by Wei-Meng Lee on 3/7/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollingViewsViewController;

@interface ScrollingViewsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ScrollingViewsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ScrollingViewsViewController *viewController;

@end

