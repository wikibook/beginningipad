//
//  UsingViews2AppDelegate.h
//  UsingViews2
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UsingViews2ViewController;

@interface UsingViews2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UsingViews2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UsingViews2ViewController *viewController;

@end

