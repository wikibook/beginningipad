//
//  RootViewController.m
//  TableView
//
//  Created by Wei-Meng Lee on 2/23/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"


@implementation RootViewController

@synthesize detailViewController;

@synthesize movieTitles, years;

@synthesize searchBar;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	//---path to the property list file---
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Movies" 
													 ofType:@"plist"];
    //---load the list into the dictionary---
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    //---save the dictionary object to the property---
    self.movieTitles = dic;
    [dic release];
    
    //---get all the keys in the dictionary object and sort them---
    NSArray *array = [[movieTitles allKeys] 
					  sortedArrayUsingSelector:@selector(compare:)];
    //---save the keys in the years property---
    self.years = array;	

	//---Search---
	self.tableView.tableHeaderView = searchBar;
	searchBar.autocorrectionType = UITextAutocorrectionTypeYes;
	
	//---copy all the movie titles in the dictionary into the listOfMovies array---
    listOfMovies = [[NSMutableArray alloc] init];
    for (NSString *year in array)    //---get all the years---
    {
        //---get all the movies for a particular year---
        NSArray *movies = [movieTitles objectForKey:year];   
        for (NSString *title in movies)   
        {
            [listOfMovies addObject:title];
        }
    }
    //---used for storing the search result---
    searchResult = [[NSMutableArray alloc] init];
    
    isSearchOn = NO;
    canSelectRow = YES;		
	
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
}

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


#pragma mark -
#pragma mark Size for popover
// The size the view should be when presented in a popover.
- (CGSize)contentSizeForViewInPopoverView {
    return CGSizeMake(320.0, 600.0);
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    //return 1;
	if (isSearchOn)
        return 1;
    else
        return [years count];    
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return 10;
	if (isSearchOn) {
        return [searchResult count];
    } else {
		//---check the current year based on the section index---
		NSString *year = [years objectAtIndex:section];
		//---returns the movies in that year as an array---
		NSArray *movieSection = [movieTitles objectForKey:year];
		//---return the number of movies for that year as the number of rows in that 
		// section ---
		return [movieSection count];
	}
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
          //cell.accessoryType = UITableViewCellAccessoryNone;
		  cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    // Configure the cell.
	if (isSearchOn) {        
        NSString *cellValue = [searchResult objectAtIndex:indexPath.row];
        cell.textLabel.text = cellValue;        
    } else {
	    //---get the year---
        NSString *year = [years objectAtIndex:[indexPath section]];
        //---get the list of movies for that year---
        NSArray *movieSection = [movieTitles objectForKey:year];
        //---get the particular movie based on that row---
        cell.textLabel.text = [movieSection objectAtIndex:[indexPath row]]; 
	}
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //---get the year as the section header---	
	NSString *year = [years objectAtIndex:section];
	if (isSearchOn)
        return nil;
    else
		return year;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"tapped");
}

/*
- (id) initWithCoder: (NSCoder *) coder {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
    }
    return self;
}
*/

/*
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	if (isSearchOn)
        return nil;
    else
        return years;	
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (canSelectRow)
        return indexPath;
    else
        return nil;
}
*/

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     When a row is selected, set the detail view controller's detail item to the item associated with the selected row.
     */
    detailViewController.detailItem = [NSString stringWithFormat:@"Row %d", indexPath.row];
}

//---fired when the user taps on the searchbar---
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    isSearchOn = YES;
    canSelectRow = NO;
    self.tableView.scrollEnabled = NO;
    //---add the Done button at the top---
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]                                                
											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
											   target:self action:@selector(doneSearching:)] autorelease];
}

//---done with the searching---
- (void) doneSearching:(id)sender {
    isSearchOn = NO;
    canSelectRow = YES;
    self.tableView.scrollEnabled = YES;
    self.navigationItem.rightBarButtonItem = nil;
    //---hides the keyboard---
    [searchBar resignFirstResponder];
    //---refresh the TableView---
    [self.tableView reloadData];
}

//---fired when the user types something into the searchbar---
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    //---if there is something to search for---
    if ([searchText length] > 0) {
        isSearchOn = YES;
        canSelectRow = YES;
        self.tableView.scrollEnabled = YES;
        [self searchMoviesTableView];
    }
    else {        
        //---nothing to search---
        isSearchOn = NO;
        canSelectRow = NO;
        self.tableView.scrollEnabled = NO;
    }    
    [self.tableView reloadData];
}

//---performs the searching using the array of movies---
- (void) searchMoviesTableView {
    //---clears the search result---
    [searchResult removeAllObjects];
    
    for (NSString *str in listOfMovies)
    {
        NSRange titleResultsRange = [str rangeOfString:searchBar.text 
											   options:NSCaseInsensitiveSearch];
        if (titleResultsRange.length > 0)
            [searchResult addObject:str];
    }
}

//---fired when the user taps the Search button on the keyboard---
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self searchMoviesTableView];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc {
	[listOfMovies release];
	[searchResult release];
	[searchBar release];
	[years release];
	[movieTitles release];	
    [super dealloc];
}

@end

