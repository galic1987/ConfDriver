//
//  ServerConstants.h
//  ConfDriver
//
//  Created by Ivo Galic on 9/4/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

// this file has server constants (hooks) needed for confdriver server clinet communication 

#import <Foundation/Foundation.h>


extern NSString * const ServerURL;
extern NSString * const CookiesURL;

extern NSString * const ServerLoginCall;
extern NSString * const ServerLogoutCall;

extern NSString * const ServerEventsByEventIdCall;
extern NSString * const ServerSingleEventCall;

extern NSString * const ServerReviewersByEventCall;
extern NSString * const ServerReviewersByPaperCall;
extern NSString * const ServerReviewersByIdCall;

extern NSString * const ServerPapersByEventIdCall;
extern NSString * const ServerSinglePaperByIdCall;
extern NSString * const ServerPapersByTopicIdCall;
extern NSString * const ServerPapersBySessionIdCall;

extern NSString * const ServerTopicsByEventIdCall;
extern NSString * const ServerSessionsByEventIdCall;
extern NSString * const ServerCriteriaByEventIdCall;
extern NSString * const ServerHistoryByEventIdCall;










