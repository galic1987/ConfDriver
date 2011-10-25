//
//  JSonRequester.m
//  ConfDriver
//
//  Created by Ivo Galic on 8/26/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "NetworkRequest.h"


@implementation NetworkRequest

//@synthesize loadingRequest = _loadingRequest;
@synthesize response;
@synthesize downloadUrl = _downloadUrl;


-(void)dealloc{
    TT_RELEASE_SAFELY(response);
    TT_RELEASE_SAFELY(_downloadUrl);
    [super dealloc];
}

-(id)init{
    self.response =  [[[TTURLDataResponse alloc] init] autorelease];
    [super init];
    return self;
}

-(BOOL)login:(NSString *)user pass:(NSString *)pass sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@",ServerURL,ServerLoginCall];
    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:_downloadUrl delegate: self] autorelease];
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    NSString *params = [[[NSString alloc]initWithFormat:@"name=%@&pass=%@",user,pass]autorelease];
    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
    request.httpBody = params2;
    request.contentType=@"application/x-www-form-urlencoded";
    
    
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        NSString *someString = [[[NSString alloc] initWithData:[[self response]data] encoding:NSUTF8StringEncoding]autorelease];

        NSDictionary * data = (NSDictionary *)[someString JSONValue];
        if ([@"OK" isEqualToString:[data objectForKey:@"message"]]) {
            return YES;
        }else{
            return NO;
        }          
    }else{
        
        [request send];
    }
    
    return YES;
}

-(NSMutableArray*)getEventsById:(NSString *)eventId sendSynchronously:(BOOL)sendSynchronously{
    _downloadUrl = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerEventCall,eventId];
    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:_downloadUrl delegate: self] autorelease];
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    request.contentType=@"application/x-www-form-urlencoded";
    
    // sendSynchronously will be used mostly in tests 
    if (sendSynchronously) {
        [request sendSynchronously];
        NSString *someString = [[[NSString alloc] initWithData:[[self response]data] encoding:NSUTF8StringEncoding]autorelease];
        NSDictionary * data = (NSDictionary *)[someString JSONValue];
        NSMutableArray * array = [[NSMutableArray alloc]init];
        
        for (NSDictionary* d in data){
            NSString * oid = [d objectForKey:@"oid"];
            NSString * name = [d objectForKey:@"name"];
            NSString * label = [d objectForKey:@"label"];
            
            //XLog("Adding to array \nOID:%@\n NAME:%@\n LABEL:%@",oid,name,label );
            Event *ev = [[[Event alloc]initWithName:name oid:oid label:label]autorelease];
            [array addObject:ev];
            
        }
        
        return array;
        
            
    }else{
        
        [request send];
    }
    
    return nil;
    
}


@end
