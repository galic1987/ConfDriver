//
//  JSonRequester.h
//  ConfDriver
//
//  Created by Ivo Galic on 8/26/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>
#import "ServerConstants.h"
#import "SBJson.h"
#import "LoginNetworkInterface.h"
#import "DataObjectNetworkInterface.h"


@interface NetworkRequest : TTURLRequestModel <TTURLResponse,DataObjectNetworkInterface,LoginNetworkInterface>{
    TTURLDataResponse *response;
    NSString* downloadUrl;

}
@property (nonatomic,retain)  TTURLDataResponse *response;
@property (nonatomic, assign) NSString* downloadUrl;

// LoginNetworkInterface
-(BOOL)login:(NSString *)user pass:(NSString *)pass sendSynchronously:(BOOL)sendSynchronously;
-(BOOL)logout:(BOOL)sendSynchronously;
-(BOOL)checkIfLogged;

// DataObjectNetworkInterface
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
