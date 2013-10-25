//
//  windowBasedAppAppDelegate.h
//  windowBasedApp
//
//  Created by Wei-Meng Lee on 2/17/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloWorldViewController;

@interface windowBasedAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	HelloWorldViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloWorldViewController *viewController;

@end

