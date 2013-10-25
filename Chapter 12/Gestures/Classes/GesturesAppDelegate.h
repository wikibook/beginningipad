//
//  GesturesAppDelegate.h
//  Gestures
//
//  Created by Wei-Meng Lee on 2/18/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GesturesViewController;

@interface GesturesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GesturesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GesturesViewController *viewController;

@end

