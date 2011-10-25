//
//  DataObjectsInterface.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataObjectsParserInterface <NSObject>
// events
+(NSArray *)getEventsFromResponse:(NSString *)response;
+(Event  *)getEventFromResponse:(NSString *)response;
// reviewers
+(NSArray *)getReviewersFromResponse:(NSString *)response;
// papers
+(NSArray *)getPapersFromResponse:(NSString *)response;
// topics
+(NSArray *)getTopicsFromResponse:(NSString *)response;
// session
+(NSArray *)getSessionsFromResponse:(NSString *)response;
// criteria
+(NSArray *)getCriteriaFromResponse:(NSString *)response;
// history
+(NSArray *)getHistoryFromResponse:(NSString *)response;

// other things
@end
