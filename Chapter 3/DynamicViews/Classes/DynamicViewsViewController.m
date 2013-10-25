//
//  DynamicViewsViewController.m
//  DynamicViews
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "DynamicViewsViewController.h"

@implementation DynamicViewsViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	//---create a UIView object---
    UIView *view =
	[[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.backgroundColor = [UIColor lightGrayColor];
	
    //---create a Label view---
    CGRect frame = CGRectMake(10, 15, 300, 20);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Verdana" size:20];
    label.text = @"This is a label";
    label.tag = 1000;
	
    //---create a Button view---
    frame = CGRectMake(10, 30, 300, 50);
	
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
	
    [button setTitle:@"Click Me, Please!" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.tag = 2000;
    [button addTarget:self action:@selector(buttonClicked:)
	 forControlEvents:UIControlEventTouchUpInside];
	
    [view addSubview:label];
    [view addSubview:button];
	
    //[self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
	
    self.view = view;
	
	//[label removeFromSuperview];
		
    [label release];
}

-(IBAction) buttonClicked: (id) sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Action invoked!"
													message:@"Button clicked!"
												   delegate:self
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
    [alert show];
    [alert release];
}

-(void) printViews: (UIView *) view {
    if ([view.subviews count] > 0){
        for (int i=0; i<[view.subviews count]; ++i) {
            UIView *v = [view.subviews objectAtIndex:i];
            NSLog([NSString stringWithFormat:@"View index: %d Tag: %d",i, v.tag]);
            [self printViews:v];
        }
    } else
        return;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	for (int i=0; i<[self.view.subviews count]; ++i) {
        UIView *view = [self.view.subviews objectAtIndex:i];
        NSLog([NSString stringWithFormat:@"%d", view.tag]);
    }
	
	[self printViews:self.view];	
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
