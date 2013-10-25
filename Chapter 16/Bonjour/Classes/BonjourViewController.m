//
//  BonjourViewController.m
//  Bonjour
//
//  Created by Wei-Meng Lee on 3/14/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "BonjourViewController.h"
#import <netinet/in.h>
#import <arpa/inet.h>

@implementation BonjourViewController

@synthesize tbView;
@synthesize debug;

@synthesize browser;
@synthesize services;

//---set the number of rows in the TableView---
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
	return [services count];    
}

//---display the individual rows in the TableView---
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView 
							 dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:CellIdentifier] autorelease];
    }
	
    //---display the hostname of each service---
    cell.textLabel.text = [[services objectAtIndex:indexPath.row] hostName];
	
    return cell;
}

//---browse for services---
-(void) browseServices {
    services = [NSMutableArray new];
    self.browser = [[NSNetServiceBrowser new] autorelease];
    self.browser.delegate = self;
    [self.browser searchForServicesOfType:@"_MyService._tcp." inDomain:@""];
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	debug.text = @"";
	[self browseServices];
    [super viewDidLoad];
}

//---services found---
-(void)netServiceBrowser:(NSNetServiceBrowser *)aBrowser 
          didFindService:(NSNetService *)aService 
              moreComing:(BOOL)more {
	
    [services addObject:aService];
    debug.text = [debug.text stringByAppendingString:
				  @"Found service. Resolving address...\n"];
    [self resolveIPAddress:aService];
}

//---services removed from the network---
-(void)netServiceBrowser:(NSNetServiceBrowser *)aBrowser 
        didRemoveService:(NSNetService *)aService moreComing:(BOOL)more {
    [services removeObject:aService];
    debug.text = [debug.text stringByAppendingFormat:@"Removed: %@\n", 
				  [aService hostName]];
    [self.tbView reloadData];
}

//---resolve the IP address(es) of a service---
-(void) resolveIPAddress:(NSNetService *)service {    
    NSNetService *remoteService = service;
    remoteService.delegate = self;
    [remoteService resolveWithTimeout:0];
}

//---managed to resolve---
-(void)netServiceDidResolveAddress:(NSNetService *)service {
    NSString           *name = nil;
    NSData             *address = nil;
    struct sockaddr_in *socketAddress = nil;
    NSString           *ipString = nil;
    int                port;
	
    //---get the IP address(es) of a service---
    for(int i=0;i < [[service addresses] count]; i++ ) {
        name = [service name];
        address = [[service addresses] objectAtIndex: i];
        socketAddress = (struct sockaddr_in *) [address bytes];
        ipString = [NSString stringWithFormat: @"%s", 
					inet_ntoa(socketAddress->sin_addr)];
        port = socketAddress->sin_port;
        debug.text = [debug.text stringByAppendingFormat:
					  @"Resolved: %@-->%@:%hu\n", [service hostName], ipString, port];
    }
    [self.tbView reloadData];
}

//---did not managed to resolve---
-(void)netService:(NSNetService *)service 
    didNotResolve:(NSDictionary *)errorDict {
	
    debug.text = [debug.text stringByAppendingFormat:
				  @"Could not resolve: %@\n", errorDict];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[tbView release];
    [debug release];    
    [browser release];
    [services release];	
    [super dealloc];
}

@end
