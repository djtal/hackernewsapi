//
//  HNItem.h
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    HNArticle,
    HNComment
} HNItemType;

@interface HNItem : NSObject{
    NSString *title;
    NSInteger type;
    NSInteger *comments;
    
}

@property (nonatomic, retain) NSString* title;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger* comments;



- (HNItem*)initFromAttributes:(NSDictionary*)attribute;
+ (HNItem*)itemFromAttribute:(NSDictionary*)attribute;

@end
