//
//  HackerNewsAPIClient.m
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HackerNewsAPIClient.h"

static HackerNewsAPIClient *_sharedClient = nil;

NSString * const kAFGowallaBaseURLString = @"http://api.thriftdb.com/api.hnsearch.com";

@implementation HackerNewsAPIClient

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (id)sharedClient {
    if (_sharedClient == nil) {
        @synchronized(self) {
            _sharedClient = [[self alloc] init];
        }
    }
    
    return _sharedClient;
}

@end
