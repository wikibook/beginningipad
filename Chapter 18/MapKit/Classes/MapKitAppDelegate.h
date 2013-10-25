//
//  MapKitAppDelegate.h
//  MapKit
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapKitViewController;

@interface MapKitAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapKitViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapKitViewController *viewController;

@end

