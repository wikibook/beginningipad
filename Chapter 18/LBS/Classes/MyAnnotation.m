//
//  MyAnnotation.m
//  LBS
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subTitle;


-(NSString *)subtitle {
    return subTitle;
}

-(NSString *)title {
    return title;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c 
                  title:(NSString *) t 
               subTitle:(NSString *) st {
	
    coordinate = c;
    self.title = t;
    self.subTitle = st;
    return self;
	
}

-(void) moveAnnotation: (CLLocationCoordinate2D) newCoordinate {
    coordinate = newCoordinate;
}

- (void) dealloc{
    [title release];
    [subTitle release];
    [super dealloc];
}

@end
