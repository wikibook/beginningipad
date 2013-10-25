//
//  DatabasesAppDelegate.m
//  Databases
//
//  Created by Wei-Meng Lee on 3/8/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "DatabasesAppDelegate.h"
#import "DatabasesViewController.h"

@implementation DatabasesAppDelegate

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
