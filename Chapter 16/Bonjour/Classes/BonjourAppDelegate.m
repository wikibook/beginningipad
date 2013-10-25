//
//  BonjourAppDelegate.m
//  Bonjour
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "BonjourAppDelegate.h"
#import "BonjourViewController.h"

@implementation BonjourAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

	//---publish the service---
    netService = [[NSNetService alloc] 
				  initWithDomain:@"" 
				  type:@"_MyService._tcp." 
				  name:@"" 
				  port:9876];
    netService.delegate = self;
    [netService publish];    

	return YES;
}

-(void)netService:(NSNetService *)aNetService 
    didNotPublish:(NSDictionary *)dict {
    NSLog(@"Service did not publish: %@", dict);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    //---stop the service when the application is terminated---
    [netService stop];
}

- (void)dealloc {
	[netService release]; 
    [viewController release];
    [window release];
    [super dealloc];
}


@end
