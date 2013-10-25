//
//  ApplicationSettingsViewController.m
//  ApplicationSettings
//
//  Created by Wei-Meng Lee on 2/23/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "ApplicationSettingsViewController.h"

@implementation ApplicationSettingsViewController

@synthesize loginName;
@synthesize password;
@synthesize favoriteColor;

NSMutableArray *colors;
NSString *favoriteColorSelected;

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
	//---create an array containing the colors values---
    colors = [[NSMutableArray alloc] init];
    [colors addObject:@"Red"];
    [colors addObject:@"Green"];
    [colors addObject:@"Blue"];
		
	[super viewDidLoad];
}

//---number of components in the Picker view---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

//---number of items(rows) in the Picker view---
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [colors count];
}

//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row
			forComponent:(NSInteger)component {
    return [colors objectAtIndex:row];
}

//---the item selected by the user---
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component {
    favoriteColorSelected = [colors objectAtIndex:row];
}

- (IBAction) loadSettings: (id) sender{

	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    loginName.text = [defaults objectForKey:@"login_name"];
    password.text = [defaults objectForKey:@"password"];
    
	//---find the index of the array for the color saved---
    favoriteColorSelected = [[NSString alloc] initWithString:
							 [defaults objectForKey:@"color"]];
    
	int selIndex = [colors indexOfObject:favoriteColorSelected];
    
	//---display the saved color in the Picker view---
    [favoriteColor selectRow:selIndex inComponent:0 animated:YES];		
}

-(IBAction) saveSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:loginName.text forKey:@"login_name"];
    [defaults setObject:password.text forKey:@"password"];
    [defaults setObject:favoriteColorSelected forKey:@"color"];
	
	UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Settings Values Saved"
                          message:@"Settings Saved"
                          delegate:nil
                          cancelButtonTitle: @"Done"
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
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
	[colors release];
    [favoriteColorSelected release];
    [loginName release];
    [password release];
    [favoriteColor release];
    [super dealloc];
}

@end
