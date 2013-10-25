//
//  FilesHandlingAppDelegate.h
//  FilesHandling
//
//  Created by Wei-Meng Lee on 2/27/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilesHandlingViewController;

@interface FilesHandlingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FilesHandlingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FilesHandlingViewController *viewController;

@end

