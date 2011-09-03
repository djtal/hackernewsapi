//
//  HackerNewsAPIClient.h
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFRestClient.h"

extern NSString * const kAFHackerNewsBaseURLString;

@interface HackerNewsAPIClient : AFRestClient
+ (id)sharedClient;
@end
