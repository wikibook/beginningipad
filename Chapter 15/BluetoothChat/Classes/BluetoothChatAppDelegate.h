//
//  BluetoothChatAppDelegate.h
//  BluetoothChat
//
//  Created by Wei-Meng Lee on 3/2/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BluetoothChatViewController;

@interface BluetoothChatAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BluetoothChatViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BluetoothChatViewController *viewController;

@end

