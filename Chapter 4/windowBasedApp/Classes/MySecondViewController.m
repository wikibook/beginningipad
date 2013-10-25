    //
//  MySecondViewController.m
//  windowBasedApp
//
//  Created by Wei-Meng Lee on 3/13/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "MySecondViewController.h"

#import "HelloWorldViewController.h"

@implementation MySecondViewController

@synthesize label, button;

//---create an instance of the view controller---
HelloWorldViewController *viewController;

-(IBAction) buttonClicked: (id) sender{
	
    //---add the view of the view controller to the current View---
    viewController = [[HelloWorldViewController alloc]
						initWithNibName:@"HelloWorldViewController" bundle:nil];
	
	[UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft
						   forView:self.view cache:YES];
	
    [self.view addSubview:viewController.view];
	
	[UIView commitAnimations];

	/*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Action invoked!"
													message:@"Button clicked!"
												   delegate:self
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
    [alert show];
    [alert release];
	 */
}

- (void)dealloc {
	[viewController release];
	[label release];
	[button release];
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	//---create a CGRect for the positioning---
    CGRect frame = CGRectMake(230, 10, 300, 50);
	
    //---create a Label view---
    label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = UITextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Verdana" size:20];
    label.text = @"This is a label";
	
    //---create a Button view---
    frame = CGRectMake(230, 100, 300, 50);
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = frame;
    [button setTitle:@"OK" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
	
	//---add the action handler and set current class as target---
    [button addTarget:self
			   action:@selector(buttonClicked:)
	 forControlEvents:UIControlEventTouchUpInside];
	
	
    [self.view addSubview:label];
    [self.view addSubview:button];	
	
	[super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
