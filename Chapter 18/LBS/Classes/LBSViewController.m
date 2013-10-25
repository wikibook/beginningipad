//
//  LBSViewController.m
//  LBS
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "LBSViewController.h"

@implementation LBSViewController

@synthesize lm;
@synthesize latitudeTextField;
@synthesize longitudeTextField;
@synthesize accuracyTextField;

@synthesize compass;
@synthesize heading;

@synthesize viewForMap;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    self.lm = [[CLLocationManager alloc] init];
	
	if ([lm locationServicesEnabled]) {
		lm.delegate = self;
		lm.desiredAccuracy = kCLLocationAccuracyBest;
		lm.distanceFilter = kCLDistanceFilterNone;
	
		[lm startUpdatingLocation];
		
		//---get the compass readings---
		[lm startUpdatingHeading];
	}
	
	//---display the map---    
    //---fill up entire screen---
    // mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    //---display in a region---
    mapView = [[MKMapView alloc] 
	   		   initWithFrame:CGRectMake(-140, -161, 1000,1000)];
			   //initWithFrame:CGRectMake(10, 60,720,678)];    
	
	mapView.delegate = self;
    mapView.mapType = MKMapTypeHybrid;
    
    //[self.view addSubview:mapView];
	[self.viewForMap addSubview:mapView];
	
    [super viewDidLoad];
}

- (void)locationManager:(CLLocationManager *)manager 
       didUpdateHeading:(CLHeading *)newHeading {
    
    heading.text = [NSString stringWithFormat:@"%f degrees", 
					newHeading.magneticHeading];
	
    //---headings is in degress---
    double d = newHeading.magneticHeading;
	
    //---convert degrees to radians---
    double radians = d/57.2957795;
    compass.transform = CGAffineTransformMakeRotation(-radians);   
	
	mapView.transform = CGAffineTransformMakeRotation(-radians);
}

- (void)dealloc {
	[annotation release];
	[compass release];
	[heading release];	
	[lm release];
    [latitudeTextField release];
    [longitudeTextField release];
    [accuracyTextField release];	
    [super dealloc];
}

- (MKAnnotationView *)mapView:(MKMapView *)aMapView 
            viewForAnnotation:(id)ann {
    
    NSString *identifier = @"myPin";
    MKPinAnnotationView *pin = 
	(MKPinAnnotationView *)[aMapView 
							dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (pin == nil) {
        pin = [[[MKPinAnnotationView alloc] initWithAnnotation:ann 
											   reuseIdentifier:identifier] autorelease];
    } else {
        pin.annotation = ann;
    }    
    
    //---display a disclosure button on the right---
    UIButton *myDetailButton = 
	[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
    myDetailButton.frame = CGRectMake(0, 0, 23, 23);
	
    myDetailButton.contentVerticalAlignment = 
	UIControlContentVerticalAlignmentCenter;
	
    myDetailButton.contentHorizontalAlignment = 
	UIControlContentHorizontalAlignmentCenter;
	
    [myDetailButton addTarget:self action:@selector(checkButtonTapped:) 
			 forControlEvents:UIControlEventTouchUpInside];
	
    pin.rightCalloutAccessoryView = myDetailButton;
	
    pin.enabled = YES;
    pin.animatesDrop=TRUE;
    pin.canShowCallout=YES;     
    return pin;
}

-(void) checkButtonTapped:(id) sender {
    //---know which button was clicked;
    // useful for multiple pins on the map---
    // UIControl *btnClicked = sender;
    
    UIAlertView *alert = [[UIAlertView alloc] 
						  initWithTitle:@"Your Current Location" 
						  message:location 
						  delegate:self
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geo 
       didFailWithError:(NSError *)error{
	
    [geocoder release];     
    geocoder = nil;
	
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geo 
       didFindPlacemark:(MKPlacemark *)placemark {
	
    location = [NSString stringWithFormat:@"%@, %@", 
				placemark.locality, placemark.country];    
    annotation.subTitle = location;
    
    [geocoder release];
    geocoder = nil;
}

- (void) locationManager:(CLLocationManager *) manager
     didUpdateToLocation:(CLLocation *) newLocation
            fromLocation:(CLLocation *) oldLocation {
	
	//---perform reverse geocoding---
    if (!geocoder) {
		
        geocoder=[[MKReverseGeocoder alloc]
				  initWithCoordinate:newLocation.coordinate];				
        geocoder.delegate = self;
        [geocoder start];
    }
	
    //---display latitude---
    NSString *lat = [[NSString alloc] initWithFormat:@"%f", 
					 newLocation.coordinate.latitude];
    latitudeTextField.text = lat;
    
    //---display longitude---
    NSString *lng = [[NSString alloc] initWithFormat:@"%f", 
					 newLocation.coordinate.longitude];
    longitudeTextField.text = lng;
	
    //---display accuracy---
    NSString *acc = [[NSString alloc] initWithFormat:@"%f", 
					 newLocation.horizontalAccuracy];
    accuracyTextField.text = acc;    
    
    [acc release];
    [lat release];
    [lng release];
	
	//---update the map---
    MKCoordinateSpan span;
    span.latitudeDelta=.003;
    span.longitudeDelta=.003;
    
    MKCoordinateRegion region;
	
    region.center = newLocation.coordinate;	
    region.span = span;
    
    [mapView setRegion:region animated:TRUE]; 
		
	//---display an annotation here---
    if (annotation) {
        [annotation moveAnnotation:newLocation.coordinate];	    
    }
    else {        
        annotation = [[MyAnnotation alloc] 
					  initWithCoordinate:newLocation.coordinate 
					  title:@"You are here" 
					  subTitle:[NSString 
								stringWithFormat:@"Lat: %@. Lng: %@", 
								latitudeTextField.text, longitudeTextField.text]];
        [mapView addAnnotation:annotation];
    }
}

- (void) locationManager:(CLLocationManager *) manager
        didFailWithError:(NSError *) error {
	
    NSString *msg = [[NSString alloc] 
					 initWithString:@"Error obtaining location"];
	
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Error" 
                          message:msg 
                          delegate:nil 
                          cancelButtonTitle: @"Done"
                          otherButtonTitles:nil];
    [alert show];    
    [msg release];
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

@end
