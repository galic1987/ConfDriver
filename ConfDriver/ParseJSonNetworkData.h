//
//  ParseJSonNetworkData.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"
#import "LoginParserInterface.h"
#import "DataObjectsParserInterface.h"
#import "SingletonUser.h"

@interface ParseJSonNetworkData : NSObject <LoginParserInterface,DataObjectsParserInterface>{
    
}
// LoginParserInterface
// LOGIN
+(BOOL)validateLogin:(NSData *)loginResponse;
+(BOOL)changeLoginObject:(NSData *)loginResponse;
+(BOOL)checkIfLogged;
+(BOOL)logout;

// DataobjectParserInterface
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
