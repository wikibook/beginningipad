//
//  UsingViewsViewController.h
//  UsingViews
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsingViewsViewController : UIViewController 
{

		IBOutlet UIPageControl *pageControl;
		IBOutlet UIImageView *imageView1;
		IBOutlet UIImageView *imageView2;
		
		UIImageView *tempImageView, *bgImageView;		
}

@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, retain) UIImageView *imageView1;
@property (nonatomic, retain) UIImageView *imageView2;

@end

