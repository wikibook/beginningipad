//
//  BonjourAppDelegate.h
//  Bonjour
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BonjourViewController;

@interface BonjourAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BonjourViewController *viewController;

	//---use this to publish a service---    
    NSNetService *netService;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BonjourViewController *viewController;

@end

