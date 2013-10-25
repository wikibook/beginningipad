//
//  WebServicesAppDelegate.h
//  WebServices
//
//  Created by Wei-Meng Lee on 3/8/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebServicesViewController;

@interface WebServicesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebServicesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebServicesViewController *viewController;

@end

