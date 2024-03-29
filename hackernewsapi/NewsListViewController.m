//
//  NewsListViewController.m
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewsListViewController.h"
#import "HackerNewsAPIClient.h"
#import "HNItem.h"


@implementation NewsListViewController

@synthesize headlines;
@synthesize searchBar;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self getlastestHeadlinesFromHacknews]; 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [searchBar resignFirstResponder];
    return indexPath;
}

- (void)getlastestHeadlinesFromHacknews{
    [self getlastestHeadlinesFromHacknewsWithQuery:nil];
}

- (void)getlastestHeadlinesFromHacknewsWithQuery:(NSDictionary*)parameters{
    NSMutableArray *lastesHeadlines = [[NSMutableArray alloc] init];
    HackerNewsAPIClient *restClient = [HackerNewsAPIClient sharedClient];
    [restClient getPath:@"items/_search" parameters:parameters success:^(id response) {
        for (NSDictionary *attributes in [response valueForKeyPath:@"results.item"]) {
            HNItem *item = [[HNItem alloc] initFromAttributes:attributes];
            [lastesHeadlines addObject:item];
            [item release];

        }
        self.headlines = lastesHeadlines;
        [lastesHeadlines release];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error");
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self getlastestHeadlinesFromHacknews];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.headlines count];
}

#pragma mark - search methods

- (void)resetSearch{
    self.headlines = nil;
}

- (void)handleSearchTermFor:(NSString*)searchTerm{
    [self getlastestHeadlinesFromHacknewsWithQuery:[NSDictionary dictionaryWithObject:searchTerm forKey:@"q"]];
}


#pragma mark - Search Bar Delagate Methods

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.text = @"";
    [self.tableView reloadData];
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchText length] == 0) {
        [self resetSearch];
        [self.tableView reloadData];
        return;
    }
    [self handleSearchTermFor:searchText];
}


@end
