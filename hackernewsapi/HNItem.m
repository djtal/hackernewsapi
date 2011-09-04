//
//  HNItem.m
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HNItem.h"
#import "HackerNewsAPIClient.h"


@implementation HNItem

@synthesize title;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (NSArray*)getLatest{
    NSMutableArray *lastesHeadlines = [[NSMutableArray alloc] init];
    NSDictionary *parameters = [[NSDictionary alloc] init];
    HackerNewsAPIClient *restClient = [HackerNewsAPIClient sharedClient];
    [restClient getPath:@"items/_search" parameters:parameters success:^(id response) {
        NSMutableArray *mutableRecords = [NSMutableArray array];
        for (NSDictionary *attributes in [response valueForKeyPath:@"results.item"]) {
            HNItem *item = [[[HNItem alloc] init] autorelease];
            item.title = [attributes objectForKey:@"title"];
            [lastesHeadlines addObject:item];
            
        }
    } failure:^(NSError *error) {
        NSLog(@"error");
    }];
    return lastesHeadlines;

}

@end
