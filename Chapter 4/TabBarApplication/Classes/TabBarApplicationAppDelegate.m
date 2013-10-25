//
//  TabBarApplicationAppDelegate.m
//  TabBarApplication
//
//  Created by Wei-Meng Lee on 3/13/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "TabBarApplicationAppDelegate.h"


@implementation TabBarApplicationAppDelegate

@synthesize window;
@synthesize tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
    [window makeKeyAndVisible];
    
    return YES;
}


/*
 // Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
 */

/*
 // Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
 */


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

