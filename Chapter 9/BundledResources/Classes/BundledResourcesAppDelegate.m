//
//  BundledResourcesAppDelegate.m
//  BundledResources
//
//  Created by Wei-Meng Lee on 2/27/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "BundledResourcesAppDelegate.h"
#import "BundledResourcesViewController.h"

@implementation BundledResourcesAppDelegate

@synthesize window;
@synthesize viewController;

- (void) copyFileInBundleToDocumentsFolder:(NSString *) fileName 
							 withExtension:(NSString *) ext {
	
	//---get the path of the Documents folder---
	NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0]; 
	
	//---get the path to the file you want to copy in the Documents folder---
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent: [NSString stringWithString:fileName]]; 
	filePath = [filePath stringByAppendingString:@"."]; 
	filePath = [filePath stringByAppendingString:ext]; 
	[filePath retain]; 
	
	//---check if file is already in Documents folder, if not, copy it from the bundle--- 
	NSFileManager *fileManger = [NSFileManager defaultManager]; 
	
	if ( ![fileManger fileExistsAtPath:filePath] ) {
		//---get the path of the file in the bundle---
		NSString *pathToFileInBundle = [[NSBundle mainBundle] pathForResource:fileName ofType:ext]; 
		
		//---copy the file in the bundle to the Documents folder---
		NSError *error = nil;
		bool success =	[fileManger copyItemAtPath:pathToFileInBundle toPath:filePath error:&error];
		if (success)		
		{
			NSLog(@"File copied");
		}
		else {
			NSLog([error localizedDescription]);
		}
	}		
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	//---copy the txt files to the Documents folder---
    [self copyFileInBundleToDocumentsFolder:@"SampleText" withExtension:@"txt"];	

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
