//
//  DatabasesAppDelegate.h
//  Databases
//
//  Created by Wei-Meng Lee on 3/8/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DatabasesViewController;

@interface DatabasesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DatabasesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DatabasesViewController *viewController;

@end

