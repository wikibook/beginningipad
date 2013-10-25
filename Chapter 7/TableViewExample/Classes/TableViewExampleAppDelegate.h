//
//  TableViewExampleAppDelegate.h
//  TableViewExample
//
//  Created by Wei-Meng Lee on 2/22/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewExampleViewController;

@interface TableViewExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TableViewExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TableViewExampleViewController *viewController;

@end

