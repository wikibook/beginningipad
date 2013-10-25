//
//  MapKitViewController.m
//  MapKit
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "MapKitViewController.h"

@implementation MapKitViewController

@synthesize btnShowLocation;
@synthesize mapView;

-(IBAction) showLocation:(id) sender {
    
    if ([[btnShowLocation titleForState:UIControlStateNormal] 
		 isEqualToString:@"Show My Location"]) {
        [btnShowLocation setTitle:@"Hide My Location" 
						 forState:UIControlStateNormal];
        mapView.showsUserLocation = YES;        
    } else {
        [btnShowLocation setTitle:@"Show My Location" 
						 forState:UIControlStateNormal];
        mapView.showsUserLocation = NO;
    }    
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

-(void)mapView:(MKMapView *)mapView 
regionWillChangeAnimated:(BOOL)animated {	
    //---print out the region span - aka zoom level---
    MKCoordinateRegion region = mapView.region;
    NSLog([NSString stringWithFormat:@"%f",region.span.latitudeDelta]);
    NSLog([NSString stringWithFormat:@"%f",region.span.longitudeDelta]);    	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    mapView.delegate = self;    
    mapView.mapType = MKMapTypeHybrid;

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
	[mapView release];
    [btnShowLocation release];
    [super dealloc];
}

@end
