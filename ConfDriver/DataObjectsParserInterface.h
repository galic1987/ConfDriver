//
//  DataObjectsInterface.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
@protocol DataObjectsParserInterface <NSObject>
@required
// events
+(NSMutableArray *)getEventsFromResponse:(NSData *)response;
+(Event  *)getEventFromResponse:(NSData *)response;
// reviewers
+(NSMutableArray *)getReviewersFromResponse:(NSData *)response;
// papers
+(NSMutableArray *)getPapersFromResponse:(NSData *)response;
// topics
+(NSMutableArray *)getTopicsFromResponse:(NSData *)response;
// session
+(NSMutableArray *)getSessionsFromResponse:(NSData *)response;
// criteria
+(NSMutableArray *)getCriteriaFromResponse:(NSData *)response;
// history
+(NSMutableArray *)getHistoryFromResponse:(NSData *)response;
@end
