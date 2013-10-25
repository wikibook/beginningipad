//
//  AccelerometerAppDelegate.h
//  Accelerometer
//
//  Created by Wei-Meng Lee on 3/6/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccelerometerViewController;

@interface AccelerometerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AccelerometerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AccelerometerViewController *viewController;

@end

