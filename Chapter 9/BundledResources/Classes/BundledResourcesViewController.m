//
//  BundledResourcesViewController.m
//  BundledResources
//
//  Created by Wei-Meng Lee on 2/27/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "BundledResourcesViewController.h"

@implementation BundledResourcesViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//---get the path of the Documents folder---
	NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0]; 
	NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"SampleText.txt"];  
	
	//---load the content of the file from the Documents folder---
	NSError *err = nil;
	NSString *fileContent = [NSString stringWithContentsOfFile:filePath 
													  encoding:NSUTF8StringEncoding 
														 error:&err]; 
	
	if (err) 
		NSLog([err description]);	
	else
	    if (fileContent) {  
		    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Content of file" 
			    											message:fileContent
				    									   delegate:self
					    						  cancelButtonTitle:@"OK"
						    					  otherButtonTitles:nil];
    		[alert show];
	    	[alert release];
	    }  			
	
    [super viewDidLoad];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
