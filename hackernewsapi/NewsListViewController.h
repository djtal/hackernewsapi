//
//  NewsListViewController.h
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListViewController : UITableViewController 
            <UISearchBarDelegate>
{
    NSArray *headlines;
    UISearchBar *searchBar;
}

@property (nonatomic, retain) NSArray *headlines;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;

- (void)getlastestHeadlinesFromHacknews;
- (void)getlastestHeadlinesFromHacknewsWithQuery:(NSDictionary*)parameters;
@end
