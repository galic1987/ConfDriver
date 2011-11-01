//
//  JSonRequester.m
//  ConfDriver
//
//  Created by Ivo Galic on 8/26/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "NetworkRequest.h"


@implementation NetworkRequest

@synthesize response;
@synthesize request;
@synthesize params;
@synthesize downloadUrl = _downloadUrl;


-(void)dealloc{
    [request release];
    [downloadUrl release];
    [params release];
    [response release];
    [super dealloc];
}

-(id)init{
    self.response =  [[TTURLDataResponse alloc] init];
    [super init];
    return self;
}

-(void)prepareRequest:(NSString*)url{
    request = [[TTURLRequest alloc] initWithURL:_downloadUrl delegate: self];
    [_downloadUrl release]; // down with one
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNone;
    request.contentType=@"application/x-www-form-urlencoded";
}

-(BOOL)login:(NSString *)user pass:(NSString *)pass sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@",ServerURL,ServerLoginCall];
    [self prepareRequest:_downloadUrl];
    XLog("%i", [_downloadUrl retainCount]);
    params = [[NSString alloc]initWithFormat:@"name=%@&pass=%@",user,pass];
    XLog(@"Login params: %@",params);
    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
    request.httpBody = params2;
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        if([ParseJSonNetworkData validateLogin:[[self response]data]]){
            [ParseJSonNetworkData changeLoginObject:[[self response]data]];
            return YES;
        }else{
            return NO;
        }
    }else{
        [request send];
    }
    
    return NO;
}

-(BOOL)logout:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@",ServerURL,ServerLogoutCall];
    [self prepareRequest:_downloadUrl];
    if (sendSynchronously) {
        [request sendSynchronously];
        [ParseJSonNetworkData logout];
        [SingletonUser logout];
        return YES;
    }else{
        [request send];
        [SingletonUser logout];
    }
    return NO;
}

-(BOOL)checkIfLogged:(BOOL)sendSynchronously{
    return [SingletonUser checkLogged];
}

-(NSMutableArray*)getEventsById:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerEventsByEventIdCall,eventId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getEventsFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}

-(Event *)getEventById:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerSingleEventCall,eventId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getEventFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}

//reviewers
-(NSMutableArray *)getReviewersByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerReviewersByEventCall,eventId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getReviewersFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}
-(NSMutableArray *)getReviewersByPaperId:(NSString *)paperId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerReviewersByPaperCall,paperId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getReviewersFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}
-(Reviewer *)getReviewerById:(NSString *)reviewerId sendSynchronously:(BOOL)sendSynchronously{
    return nil;
}

//papers
-(NSMutableArray *)getPapersByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerPapersByEventIdCall,eventId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getPapersFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}
-(NSMutableArray *)getPapersByTopicId:(NSString *)topicId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerPapersByTopicIdCall,topicId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getPapersFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}
-(NSMutableArray *)getPapersBySessionId:(NSString *)sessionId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerPapersBySessionIdCall,sessionId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getPapersFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}
-(Paper *)getPaperById:(NSString *)paperId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerSinglePaperByIdCall,paperId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return (Paper *)[[ParseJSonNetworkData getPapersFromResponse:[[self response]data]] objectAtIndex:0];  
    }else{
        [request send];
    }
    return nil;
}

//topics
-(NSMutableArray *)getTopicsByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerTopicsByEventIdCall,eventId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getTopicsFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}

//sessions
-(NSMutableArray *)getSessionsByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerSessionsByEventIdCall,eventId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getSessionsFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}

//criteria
-(NSMutableArray *)getCriteriaByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerCriteriaByEventIdCall,eventId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getCriteriaFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}

//history
-(NSMutableArray *)getHistoryByEventId:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerHistoryByEventIdCall,eventId];
    [self prepareRequest:_downloadUrl];
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        return [ParseJSonNetworkData getHistoryFromResponse:[[self response]data]];  
    }else{
        [request send];
    }
    return nil;
}

- (NSError*)request:(TTURLRequest*)request processResponse:(NSHTTPURLResponse*)response data:(id)data{
    XLog();
    return nil;
}
@end
