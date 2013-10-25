//
//  GesturesViewController.m
//  Gestures
//
//  Created by Wei-Meng Lee on 2/18/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "GesturesViewController.h"

@implementation GesturesViewController

@synthesize imageView;

NSArray *images;
int imageIndex = 0;

CGPoint netTranslation;
CGFloat lastScaleFactor=1;
CGFloat netRotation;

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
	
    //imageViewPosition = imageView.center;
	
	//---tap gesture---
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
	tapGesture.numberOfTapsRequired = 2;
	[self.imageView addGestureRecognizer:tapGesture];
	[tapGesture release];

	//---pinch gesture---
	UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [imageView addGestureRecognizer:pinchGesture];
	[pinchGesture release];	
	
	//---rotate gesture---
	UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotateGesture:)];
    [imageView addGestureRecognizer:rotateGesture];
	[rotateGesture release];	
		
	//---pan gesture---
	UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
	[imageView addGestureRecognizer:panGesture];
	[panGesture release];	
		
	/*
	//---swipe gesture---
	images = [[NSArray alloc] initWithObjects:@"architecture.jpg", @"Buildings.jpeg", @"Bridge.jpeg", nil];

	//---right swipe (default)---
	UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
	[imageView addGestureRecognizer:swipeGesture];
	[swipeGesture release];

	//---left swipe---
	UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
	swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
	[imageView addGestureRecognizer:swipeLeftGesture];
	[swipeLeftGesture release];
	
	//---long press gesture---
	UILongPressGestureRecognizer *longpressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongpressGesture:)];
	longpressGesture.minimumPressDuration = 1;
	longpressGesture.allowableMovement = 15;
	longpressGesture.numberOfTouchesRequired = 1;
	[imageView addGestureRecognizer:longpressGesture];
	[longpressGesture release];
	*/
	
	[super viewDidLoad];
}

//---handle long press gesture---
-(IBAction) handleLongpressGesture:(UIGestureRecognizer *) sender {	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Image options" 
															 delegate:self 
													cancelButtonTitle:nil 
											   destructiveButtonTitle:nil 
													otherButtonTitles:@"Save Image", @"Copy", nil];
	//---remember to implement the UIActionSheetDelegate protocol in your view controller---
	[actionSheet showInView:self.view];
	[actionSheet release];	
}

//---handle swipe gesture---
-(IBAction) handleSwipeGesture:(UIGestureRecognizer *) sender {
	UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) sender direction];
	switch (direction) {
		case UISwipeGestureRecognizerDirectionUp:
			NSLog(@"up");			
			break;
		case UISwipeGestureRecognizerDirectionDown:
			NSLog(@"down");	
			break;
		case UISwipeGestureRecognizerDirectionLeft:
			imageIndex++;
			break;
		case UISwipeGestureRecognizerDirectionRight:
			imageIndex--;
			break;			
		default:
			break;
	}	
    imageIndex = (imageIndex < 0) ? ([images count] - 1): imageIndex % [images count];
	imageView.image = [UIImage imageNamed:[images objectAtIndex:imageIndex]];
}


//---handle pan gesture---
-(IBAction) handlePanGesture:(UIGestureRecognizer *) sender {
	//---previously as stated in the book---
	//CGPoint translation = [(UIPanGestureRecognizer *) sender translation];
	CGPoint translation = [(UIPanGestureRecognizer *) sender translationInView:imageView];
	
	sender.view.transform = CGAffineTransformMakeTranslation(netTranslation.x + translation.x,
														   netTranslation.y + translation.y);
	if (sender.state == UIGestureRecognizerStateEnded){
		netTranslation.x += translation.x;
		netTranslation.y += translation.y;		
	}	
}

//---handle rotate gesture---
-(IBAction) handleRotateGesture:(UIGestureRecognizer *) sender {
	CGFloat rotation = [(UIRotationGestureRecognizer *) sender rotation];
    CGAffineTransform transform = CGAffineTransformMakeRotation(rotation + netRotation);
    sender.view.transform = transform;	
		
	if (sender.state == UIGestureRecognizerStateEnded){
	    netRotation += rotation;	
	}		
}

//---handle tap gesture---
-(IBAction) handleTapGesture:(UIGestureRecognizer *) sender {
	if (sender.view.contentMode == UIViewContentModeScaleAspectFit)
        sender.view.contentMode = UIViewContentModeCenter;
	else
		sender.view.contentMode = UIViewContentModeScaleAspectFit;
}

//---handle pinch gesture---
-(IBAction) handlePinchGesture:(UIGestureRecognizer *) sender {
	CGFloat factor = [(UIPinchGestureRecognizer *) sender scale];
	
	NSLog(@"%f", factor);
	//if the current factor is greater 1 --> zoom in
	if (factor > 1) {
		imageView.transform = CGAffineTransformMakeScale(lastScaleFactor + (factor-1),
														 lastScaleFactor + (factor-1));
	} else {
		imageView.transform = CGAffineTransformMakeScale(lastScaleFactor * factor, 
														 lastScaleFactor * factor);
	}
		
	if (sender.state == UIGestureRecognizerStateEnded){
		if (factor > 1) {
			lastScaleFactor += (factor-1);
		} else {
			lastScaleFactor *= factor;
		}		
	}	
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
	[images release];
	[imageView release];
    [super dealloc];
}

@end
