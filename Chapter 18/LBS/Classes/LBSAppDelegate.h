//
//  LBSAppDelegate.h
//  LBS
//
//  Created by Wei-Meng Lee on 2/24/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LBSViewController;

@interface LBSAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LBSViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LBSViewController *viewController;

@end

