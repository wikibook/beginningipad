//
//  UsingViewsAppDelegate.m
//  UsingViews
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "UsingViewsAppDelegate.h"
#import "UsingViewsViewController.h"

@implementation UsingViewsAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
