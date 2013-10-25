//
//  MapKitViewController.h
//  MapKit
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>

@interface MapKitViewController : UIViewController <MKMapViewDelegate> {
    IBOutlet UIButton *btnShowLocation;
    IBOutlet MKMapView *mapView;
}

@property (nonatomic, retain) UIButton *btnShowLocation;
@property (nonatomic, retain) MKMapView *mapView;

-(IBAction) showLocation:(id) sender;

@end

