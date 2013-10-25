//
//  ApplicationSettingsAppDelegate.h
//  ApplicationSettings
//
//  Created by Wei-Meng Lee on 2/23/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationSettingsViewController;

@interface ApplicationSettingsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ApplicationSettingsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ApplicationSettingsViewController *viewController;

@end

