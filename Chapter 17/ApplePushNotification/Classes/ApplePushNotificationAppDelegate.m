//
//  ApplePushNotificationAppDelegate.m
//  ApplePushNotification
//
//  Created by Wei-Meng Lee on 11/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ApplePushNotificationAppDelegate.h"
#import "ApplePushNotificationViewController.h"

@implementation ApplePushNotificationAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	NSLog(@"Registering for push notifications...");	
	[[UIApplication sharedApplication] 
	    registerForRemoteNotificationTypes:
	    (UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken { 
	NSString *str = [NSString stringWithFormat:@"Device Token=%@",deviceToken];
	NSLog(str);
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err { 
	NSString *str = [NSString stringWithFormat: @"Error: %@", err ];
	NSLog(str);	
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
	for (id key in userInfo) {
		NSLog(@"key: %@, value: %@", key, [userInfo objectForKey:key]);
	}	
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end