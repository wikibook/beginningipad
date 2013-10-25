//
//  viewBasedAppAppDelegate.h
//  viewBasedApp
//
//  Created by Wei-Meng Lee on 2/17/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class viewBasedAppViewController;

@interface viewBasedAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    viewBasedAppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet viewBasedAppViewController *viewController;

@end

