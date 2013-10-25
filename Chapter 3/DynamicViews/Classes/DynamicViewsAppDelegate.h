//
//  DynamicViewsAppDelegate.h
//  DynamicViews
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DynamicViewsViewController;

@interface DynamicViewsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DynamicViewsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DynamicViewsViewController *viewController;

@end

