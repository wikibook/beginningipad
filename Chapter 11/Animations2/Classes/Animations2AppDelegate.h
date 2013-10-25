//
//  Animations2AppDelegate.h
//  Animations2
//
//  Created by Wei-Meng Lee on 2/20/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Animations2ViewController;

@interface Animations2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Animations2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Animations2ViewController *viewController;

@end

