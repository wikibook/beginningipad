//
//  windowBasedAppAppDelegate.m
//  windowBasedApp
//
//  Created by Wei-Meng Lee on 2/17/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "windowBasedAppAppDelegate.h"
#import "HelloWorldViewController.h"

#import "MySecondViewController.h"

@implementation windowBasedAppAppDelegate

@synthesize window;
@synthesize viewController;

//---create an instance of the second view controller---
MySecondViewController *mySecondViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	//---instantiate the second view controller---
    mySecondViewController = [[MySecondViewController alloc]
							  initWithNibName:nil
		    				  bundle:nil];	
	
    //---add the view from the second view controller---
    [window addSubview:mySecondViewController.view];
	//[window addSubview:viewController.view];
	
    //---comment this out so that it doesn't load the viewController---
    //[window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc {
	[mySecondViewController release];
	[viewController release];
    [window release];
    [super dealloc];
}

@end
