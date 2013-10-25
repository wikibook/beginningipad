//
//  ScreenRotationsViewController.m
//  ScreenRotations
//
//  Created by Wei-Meng Lee on 2/28/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "ScreenRotationsViewController.h"

@implementation ScreenRotationsViewController

@synthesize btn;

-(IBAction) btnClicked: (id) sender { 
	[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeLeft];
}

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
    [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortrait;

	[self positionViews];
    [super viewDidLoad];
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
                                                    duration: (NSTimeInterval) duration {	
	NSLog(@"%d", toInterfaceOrientation);
}

-(void) positionViews {
	UIInterfaceOrientation destOrientation = self.interfaceOrientation;
	if (destOrientation == UIInterfaceOrientationPortrait ||
		destOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		//---if rotating to portrait mode---
		btn.frame = CGRectMake(20, 20, 371, 37);
	} else {
		//---if rotating to landscape mode---		
		btn.frame = CGRectMake(633, 691, 371, 37);
	}	
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation: (UIInterfaceOrientation) fromInterfaceOrientation 
                                                       duration: (NSTimeInterval) duration {
	[self positionViews];
}

- (void)willRotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
                                duration: (NSTimeInterval) duration {
	
}

/*
- (void)willAnimateRotationToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
                                         duration: (NSTimeInterval) duration {
	
}
*/

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
	
	//return (interfaceOrientation == UIInterfaceOrientationPortrait || 
	//		interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
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
	[btn release];
    [super dealloc];
}

@end
