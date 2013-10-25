//
//  WebServicesViewController.h
//  WebServices
//
//  Created by Wei-Meng Lee on 3/8/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebServicesViewController : UIViewController {
    IBOutlet UITextField *ipAddress;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
    NSMutableData *webData;
    NSMutableString *soapResults;
    NSURLConnection *conn;	
	
	NSXMLParser *xmlParser;
    BOOL elementFound;
}

@property (nonatomic, retain) UITextField *ipAddress;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

- (IBAction)buttonClicked:(id)sender;

@end

