//
//  ScrollingViewsViewController.m
//  ScrollingViews
//
//  Created by Wei-Meng Lee on 3/7/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "ScrollingViewsViewController.h"

@implementation ScrollingViewsViewController

@synthesize textField;
@synthesize scrollView;

//---size of keyboard---
CGRect keyboardBounds;  

//---size of application screen---
CGRect applicationFrame;

//---original size of ScrollView---
CGSize scrollViewOriginalSize;

-(void) moveScrollView:(UIView *) theView {  
	
	NSLog(@"%f", keyboardBounds.size.height);
	
	
    //---get the y-coordinate of the view---
    CGFloat viewCenterY = theView.center.y;  
    
    //---calculate how much visible space is left---
    CGFloat freeSpaceHeight = applicationFrame.size.height - keyboardBounds.size.height;      
    
    //---calculate how much the scrollview must scroll---
    CGFloat scrollAmount = viewCenterY - freeSpaceHeight / 2.0;  
    
    if (scrollAmount < 0)  scrollAmount = 0;  
	
    //---set the new scrollView contentSize---
    scrollView.contentSize = CGSizeMake(applicationFrame.size.width, 
										applicationFrame.size.height + 
										keyboardBounds.size.height);  
    
    //---scroll the ScrollView---
    [scrollView setContentOffset:CGPointMake(0, scrollAmount) animated:YES];  
}

//---when a TextField view begins editing---
-(void) textFieldDidBeginEditing:(UITextField *)textFieldView {  
	currTextField = textFieldView;
    //[self moveScrollView:textFieldView];
}  

//---when a TextField view is done editing---
-(void) textFieldDidEndEditing:(UITextField *) textFieldView {  
    [UIView beginAnimations:@"back to original size" context:nil];
    scrollView.contentSize = scrollViewOriginalSize;
    [UIView commitAnimations];    
}

//---when the keyboard appears---
-(void) keyboardWillShow:(NSNotification *) notification
{
    //---gets the size of the keyboard---
    NSDictionary *userInfo = [notification userInfo];  
    NSValue *keyboardValue = [userInfo objectForKey:UIKeyboardBoundsUserInfoKey];  
    [keyboardValue getValue:&keyboardBounds];      
	
	///*********************************
	[self moveScrollView:currTextField];
}

//---when the keyboard disappears---
-(void) keyboardWillHide:(NSNotification *) notification
{
}

-(void) viewWillAppear:(BOOL)animated
{    
    //---registers the notifications for keyboard---
    [[NSNotificationCenter defaultCenter] 
	 addObserver:self 
	 selector:@selector(keyboardWillShow:) 
	 name:UIKeyboardWillShowNotification 
	 object:self.view.window]; 
    
    [[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(keyboardWillHide:)
	 name:UIKeyboardWillHideNotification
	 object:nil];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self 
	 name:UIKeyboardWillShowNotification 
	 object:nil];
    
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self 
	 name:UIKeyboardWillHideNotification 
	 object:nil];
}

-(void) viewDidLoad {
    scrollViewOriginalSize = scrollView.contentSize;
    applicationFrame = [[UIScreen mainScreen] applicationFrame];
    [super viewDidLoad];
}

-(BOOL) textFieldShouldReturn:(UITextField *) textFieldView {  
    if (textFieldView == textField){
        [textField resignFirstResponder];
    }
    return NO;
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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
	[textField release];
    [scrollView release];

    [super dealloc];
}

@end
