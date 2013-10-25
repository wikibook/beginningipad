//
//  BluetoothAppDelegate.h
//  Bluetooth
//
//  Created by Wei-Meng Lee on 3/1/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BluetoothViewController;

@interface BluetoothAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BluetoothViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BluetoothViewController *viewController;

@end

