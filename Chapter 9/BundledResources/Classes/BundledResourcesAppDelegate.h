//
//  BundledResourcesAppDelegate.h
//  BundledResources
//
//  Created by Wei-Meng Lee on 2/27/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BundledResourcesViewController;

@interface BundledResourcesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BundledResourcesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BundledResourcesViewController *viewController;

@end

