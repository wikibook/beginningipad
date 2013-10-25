//
//  OutletsAndActionsAppDelegate.h
//  OutletsAndActions
//
//  Created by Wei-Meng Lee on 3/15/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OutletsAndActionsViewController;

@interface OutletsAndActionsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    OutletsAndActionsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet OutletsAndActionsViewController *viewController;

@end

