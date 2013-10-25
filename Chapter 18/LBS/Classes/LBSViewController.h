//
//  LBSViewController.h
//  LBS
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#import "MyAnnotation.h"

#import <MapKit/MKReverseGeocoder.h>

@interface LBSViewController : UIViewController 
    <CLLocationManagerDelegate, MKMapViewDelegate, MKReverseGeocoderDelegate> {

	IBOutlet UITextField *accuracyTextField;
	IBOutlet UITextField *latitudeTextField;
	IBOutlet UITextField *longitudeTextField;
	CLLocationManager *lm;
		
    MKMapView *mapView;  

	IBOutlet UIImageView *compass;
	IBOutlet UILabel *heading;
		
	MyAnnotation *annotation;
		
    NSString *location;
	MKReverseGeocoder *geocoder;
		
	IBOutlet UIView *viewForMap;
}

@property (retain, nonatomic) CLLocationManager *lm;
@property (retain, nonatomic) UITextField *accuracyTextField;
@property (retain, nonatomic) UITextField *latitudeTextField;
@property (retain, nonatomic) UITextField *longitudeTextField;

@property (nonatomic, retain) UIImageView *compass;
@property (nonatomic, retain) UILabel *heading;

@property (nonatomic, retain) IBOutlet UIView *viewForMap;

@end

