//
//  TableViewAppDelegate.m
//  TableView
//
//  Created by Wei-Meng Lee on 2/23/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "TableViewAppDelegate.h"


#import "RootViewController.h"
#import "DetailViewController.h"


@implementation TableViewAppDelegate

@synthesize window, splitViewController, rootViewController, detailViewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    
    // Add the split view controller's view to the window and display.
    [window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}


@end

