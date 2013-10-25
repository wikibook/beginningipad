//
//  UsingViewsAppDelegate.h
//  UsingViews
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UsingViewsViewController;

@interface UsingViewsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UsingViewsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UsingViewsViewController *viewController;

@end

