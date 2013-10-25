//
//  AnimationAppDelegate.h
//  Animation
//
//  Created by Wei-Meng Lee on 2/20/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimationViewController;

@interface AnimationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AnimationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AnimationViewController *viewController;

@end

