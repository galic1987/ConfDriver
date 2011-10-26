//
//  ServerConstants.m
//  ConfDriver
//
//  Created by Ivo Galic on 9/4/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "ServerConstants.h"


// server url where confDriver server is located
NSString * const ServerURL = @"http://webcampus.ifs.tuwien.ac.at/confdriver";
NSString * const CookiesURL = @".webcampus.ifs.tuwien.ac.at"; // cookies url prefix

NSString * const ServerLoginCall = @"/member/login"; // params user and pass
NSString * const ServerLogoutCall = @"/member/logout";

NSString * const ServerEventsByEventIdCall = @"/service/events/"; // +event_id
NSString * const ServerSingleEventCall = @"/service/event/"; // +event_id

 NSString * const ServerReviewersByEventCall= @"/service/reviewers/"; // +event_id
 NSString * const ServerReviewersByPaperCall= @"/service/reviewersByPaperId/"; //+paper_id
 NSString * const ServerReviewersByIdCall= @"/service/reviewerById/"; //+reviewer_id

 NSString * const ServerPapersByEventIdCall= @"/service/papers/"; //+event_id
 NSString * const ServerSinglePaperByIdCall= @"/service/paperById/"; //+paper_id
 NSString * const ServerPapersByTopicIdCall= @"/service/papersByTopic/"; //+topic_id
 NSString * const ServerPapersBySessionIdCall= @"/service/papersBySession/"; //+session_id

 NSString * const ServerTopicsByEventIdCall= @"/service/topics/"; //+event_id
 NSString * const ServerSessionsByEventIdCall= @"/service/sessions/"; //+event_id
 NSString * const ServerCriteriaByEventIdCall= @"/service/criteria/"; //+event_id
 NSString * const ServerHistoryByEventIdCall= @"/service/history/"; //+event_id