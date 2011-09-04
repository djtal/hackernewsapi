//
//  NewsListViewController.h
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListViewController : UITableViewController {
    NSArray *headlines;
}

@property (nonatomic, retain) NSArray *headlines;


- (void)getlastestHeadlinesFromHacknews;
@end
