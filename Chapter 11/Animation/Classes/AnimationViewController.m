//
//  AnimationViewController.m
//  Animation
//
//  Created by Wei-Meng Lee on 2/20/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "AnimationViewController.h"

@implementation AnimationViewController


@synthesize imageView;
@synthesize slider;

-(void) onTimer {
	//---rotation---
    //imageView.transform = CGAffineTransformMakeRotation(angle);
	imageView.transform = CGAffineTransformMakeScale(angle, angle);	
    angle += 0.02;
    if (angle>6.2857) angle = 0;

    /*	
    imageView.center = CGPointMake(
								   imageView.center.x + delta.x,
								   imageView.center.y + delta.y); 
    */	
	
	[UIView beginAnimations:@"my_own_animation" context:nil];
	[UIView setAnimationDuration:slider.value];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	
    imageView.center = CGPointMake(imageView.center.x + delta.x,
                                   imageView.center.y + delta.y);

	[UIView commitAnimations];
	
    if (imageView.center.x > self.view.bounds.size.width - ballRadius || imageView.center.x < ballRadius)
        delta.x = -delta.x;
    if (imageView.center.y > self.view.bounds.size.height - ballRadius || imageView.center.y < ballRadius)
        delta.y = -delta.y;
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
	//---set the angle to 0---
    angle = 0;
	
    ballRadius = imageView.frame.size.width/2;
    [slider setShowValue:YES];
    delta = CGPointMake(12.0,4.0);
	translation = CGPointMake(0.0,0.0);
	
    timer = [NSTimer scheduledTimerWithTimeInterval:slider.value
											 target:self
										   selector:@selector(onTimer)
										   userInfo:nil
											repeats:YES];
    [super viewDidLoad];
}

-(IBAction) sliderMoved:(id) sender {
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:slider.value
											 target:self
										   selector:@selector(onTimer)
										   userInfo:nil
											repeats:YES];
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
	[timer invalidate];
    [imageView release];
    [slider release];
    [super dealloc];
}

@end
