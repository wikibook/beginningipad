//
//  BonjourViewController.h
//  Bonjour
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BonjourViewController : UIViewController {
    //---outlets---
    IBOutlet UITableView *tbView;
    IBOutlet UITextView *debug;	
	
	//---use for browsing services---
    NSNetServiceBrowser *browser;
    NSMutableArray *services;	
}

-(void) resolveIPAddress:(NSNetService *)service;
-(void) browseServices;

//---expose the outlets as properties---
@property (nonatomic, retain) UITableView *tbView;
@property (nonatomic, retain) UITextView *debug;

@property (readwrite, retain) NSNetServiceBrowser *browser;
@property (readwrite, retain) NSMutableArray *services;

@end

