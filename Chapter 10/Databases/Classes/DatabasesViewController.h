//
//  DatabasesViewController.h
//  Databases
//
//  Created by Wei-Meng Lee on 3/8/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "sqlite3.h"

@interface DatabasesViewController : UIViewController {
  sqlite3 *db;
}

-(NSString *) filePath;

@end

