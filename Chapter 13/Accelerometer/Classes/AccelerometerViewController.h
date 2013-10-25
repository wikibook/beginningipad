//
//  AccelerometerViewController.h
//  Accelerometer
//
//  Created by Wei-Meng Lee on 3/6/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccelerometerViewController : UIViewController 
    <UIAccelerometerDelegate> {

	IBOutlet UILabel *labelX;
	IBOutlet UILabel *labelY;
	IBOutlet UILabel *labelZ;
}

@property (nonatomic, retain) UILabel *labelX;
@property (nonatomic, retain) UILabel *labelY;
@property (nonatomic, retain) UILabel *labelZ;

@end

