//
//  ApplePushNotificationAppDelegate.h
//  ApplePushNotification
//
//  Created by Wei-Meng Lee on 11/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplePushNotificationViewController;

@interface ApplePushNotificationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ApplePushNotificationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ApplePushNotificationViewController *viewController;

@end

