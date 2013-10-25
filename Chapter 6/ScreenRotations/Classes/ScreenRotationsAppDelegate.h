//
//  ScreenRotationsAppDelegate.h
//  ScreenRotations
//
//  Created by Wei-Meng Lee on 2/28/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScreenRotationsViewController;

@interface ScreenRotationsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ScreenRotationsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ScreenRotationsViewController *viewController;

@end

