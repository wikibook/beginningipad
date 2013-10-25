//
//  RootViewController.h
//  TableView
//
//  Created by Wei-Meng Lee on 2/23/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController {
    DetailViewController *detailViewController;
	
	NSDictionary *movieTitles;
	NSArray *years;
	
	IBOutlet UISearchBar *searchBar;
	
	BOOL isSearchOn;
    BOOL canSelectRow;    
	
    NSMutableArray *listOfMovies;
    NSMutableArray *searchResult;	
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain) NSDictionary *movieTitles;
@property (nonatomic, retain) NSArray *years;

@property (nonatomic, retain) UISearchBar *searchBar;

- (void) doneSearching: (id)sender;
- (void) searchMoviesTableView;

@end
