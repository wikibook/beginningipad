//
//  Animations2ViewController.m
//  Animations2
//
//  Created by Wei-Meng Lee on 2/20/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "Animations2ViewController.h"

@implementation Animations2ViewController

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

	NSArray *images = [NSArray arrayWithObjects:
					   [UIImage imageNamed:@"MacSE.jpeg"],
					   [UIImage imageNamed:@"imac.jpeg"],
					   [UIImage imageNamed:@"MacPlus.jpg"],
					   [UIImage imageNamed:@"imac_old.jpeg"],
					   [UIImage imageNamed:@"Mac8100.jpeg"],
					   nil];
    CGRect frame = CGRectMake(0,0,320 ,460);
	
	
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.animationImages = images;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.animationDuration = 9;    //---seconds to complete one set
	// of animation---
    imageView.animationRepeatCount = 0; //---continuous---
    [imageView startAnimating];
    [self.view addSubview:imageView];
    [imageView release];
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
