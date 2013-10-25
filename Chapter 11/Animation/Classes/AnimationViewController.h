//
//  AnimationViewController.h
//  Animation
//
//  Created by Wei-Meng Lee on 2/20/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewController : UIViewController {
    IBOutlet UIImageView *imageView;
    IBOutlet UISlider *slider;
	
    CGPoint delta;
	CGPoint translation;
	
    NSTimer *timer;
	
    float ballRadius;
    float angle;
}

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UISlider *slider;

-(IBAction) sliderMoved:(id) sender;

@end


