//
//  MapKitAppDelegate.m
//  MapKit
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "MapKitAppDelegate.h"
#import "MapKitViewController.h"

@implementation MapKitAppDelegate

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
