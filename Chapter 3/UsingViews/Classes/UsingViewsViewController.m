//
//  UsingViewsViewController.m
//  UsingViews
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "UsingViewsViewController.h"

@implementation UsingViewsViewController

@synthesize pageControl;
@synthesize imageView1, imageView2;


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

//---when the page control’s value is changed---
- (void) pageTurning: (UIPageControl *) pageController
{
    //---get the page number you can turning to---
    NSInteger nextPage = [pageController currentPage];
    switch (nextPage) {
        case 0:
            [tempImageView setImage:[UIImage imageNamed:@"iMac_old.jpeg"]];
            break;
        case 1:
            [tempImageView setImage:[UIImage imageNamed:@"iMac.jpeg"]];
            break;
        case 2:
            [tempImageView setImage:[UIImage imageNamed:@"Mac8100.jpeg"]];
            break;
        case 3:
            [tempImageView setImage:[UIImage imageNamed:@"MacPlus.jpeg"]];
            break;
        case 4:
            [tempImageView setImage:[UIImage imageNamed:@"MacSE.jpeg"]];
            break;
        default:
            break;
    }
	
    //---switch the two imageview views---
    if (tempImageView.tag==0) { //---imageView1---
        tempImageView = imageView2;
        bgImageView = imageView1;
    }
    else {    //---imageView2---
        tempImageView = imageView1;
        bgImageView = imageView2;
    }
	
    //---animate the two views flipping---
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft
						   forView:tempImageView cache:YES];
    [tempImageView setHidden:YES];
    [UIView commitAnimations];
	
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight
						   forView:bgImageView cache:YES];
    [bgImageView setHidden:NO];
    [UIView commitAnimations];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	//---initialize the first imageview to display an image---
    [imageView1 setImage:[UIImage imageNamed:@"iMac_old.jpeg"]];
    tempImageView = imageView2;
	
    //---make the first imageview visible and hide the second---
    [imageView1 setHidden:NO];
    [imageView2 setHidden:YES];
	
    //---add the event handler for the page control---
    [pageControl addTarget:self action:@selector(pageTurning:)
		  forControlEvents:UIControlEventValueChanged];
	
	
	
	
	
	/*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello"
													message:@"This is an alert view"
												   delegate:self
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:@"Option 1", @"Option 2", nil];
    [alert show];
    [alert release];

	UIActionSheet *action = [[UIActionSheet alloc]
							 initWithTitle:@"Title of Action Sheet"
							 delegate:self
							 cancelButtonTitle:@"OK"
							 destructiveButtonTitle:@"Delete Message"
							 otherButtonTitles:@"Option 1", @"Option 2", nil];
    [action showInView:self.view];
    [action release];
	 */
	
	[super viewDidLoad];	
}

/*
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
    NSLog([NSString stringWithFormat:@"%d", buttonIndex]);
	
}

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex{
	
    NSLog([NSString stringWithFormat:@"%d", buttonIndex]);
	
}
*/


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
	[pageControl release];
    [imageView1 release];
    [imageView2 release];
	
    [super dealloc];
}

@end
