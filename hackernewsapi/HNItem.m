//
//  HNItem.m
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HNItem.h"


@implementation HNItem

@synthesize title;
@synthesize type;
@synthesize comments;

NSString * const kCommentType = @"comment";
NSString * const kArticleType = @"submission";

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (HNItem*)initFromAttributes:(NSDictionary*)attribute{
    if ([self init]) {
        if (attribute) {
            NSString *tmpTitle;
            //type first
            if ([[attribute objectForKey:@"type"] isEqualToString:kArticleType]) {
                self.type = HNArticle;
                tmpTitle = [[NSString alloc] initWithString:[attribute objectForKey:@"title"]];
            } else {
                self.type = HNComment;
                NSDictionary *discussion = [attribute objectForKey:@"discussion"];
                if (![discussion isEqual:[NSNull null]])
                {
                    tmpTitle = [[NSString alloc] initWithString: [discussion objectForKey:@"title"]];
                }
                else
                   tmpTitle = @"unknow title"; 
            }
            
            self.title = tmpTitle;
            [tmpTitle release];
        }
    }
    return self;
         
}

+ (HNItem*)itemFromAttribute:(NSDictionary*)attribute{
    
}
@end
