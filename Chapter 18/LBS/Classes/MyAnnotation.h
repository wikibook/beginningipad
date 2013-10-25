//
//  MyAnnotation.h
//  LBS
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation> {	
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subTitle;	
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subTitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c 
                  title:(NSString *) t 
               subTitle:(NSString *) st;

-(void) moveAnnotation: (CLLocationCoordinate2D) newCoordinate;

-(NSString *)subtitle;
-(NSString *)title;

@end
