//
//  ShakeAppDelegate.h
//  Shake
//
//  Created by Wei-Meng Lee on 3/6/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShakeViewController;

@interface ShakeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ShakeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ShakeViewController *viewController;

@end

