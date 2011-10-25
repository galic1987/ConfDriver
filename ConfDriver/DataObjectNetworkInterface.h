//
//  DataObjectNetworkInterface.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reviewer.h"
#import "Event.h"
#import "Paper.h"
#import "Topic.h"
#import "Session.h"
#import "Criteria.h"
#import "History.h"

@protocol DataObjectNetworkInterface <NSObject>
@required
//events
-(NSMutableArray *)getEventsById:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously;
-(Event *)getEventById:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously;
//reviewers
-(NSMutableArray *)getReviewersByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously;
-(NSMutableArray *)getReviewersByPaperId:(NSString *)paperId sendSynchronously:(BOOL)sendSynchronously;
-(Reviewer *)getReviewerById:(NSString *)reviewerId sendSynchronously:(BOOL)sendSynchronously;
//papers
-(NSMutableArray *)getPapersByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously;
-(NSMutableArray *)getPapersByTopicId:(NSString *)topicId sendSynchronously:(BOOL)sendSynchronously;
-(NSMutableArray *)getPapersBySessionId:(NSString *)sessionId sendSynchronously:(BOOL)sendSynchronously;
-(Paper *)getPaperById:(NSString *)paperId sendSynchronously:(BOOL)sendSynchronously;
//topics
-(NSMutableArray *)getTopicsByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously;
//sessions
-(NSMutableArray *)getSessionsByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously;
//criteria
-(NSMutableArray *)getCriteriaByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously;
//history
-(NSMutableArray *)getHistoryByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously;
@end
