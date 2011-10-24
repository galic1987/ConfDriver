//
//  JSonRequester.m
//  ConfDriver
//
//  Created by Ivo Galic on 8/26/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "JSonRequester.h"


@implementation JSonRequester

//@synthesize loadingRequest = _loadingRequest;
@synthesize response;
@synthesize downloadUrl = _downloadUrl;


-(void)dealloc{
    TT_RELEASE_SAFELY(response);
    TT_RELEASE_SAFELY(_downloadUrl);
    [super dealloc];
}

-(id)init{
    self.response =  [[[TTURLDataResponse alloc] init] autorelease] ;
    [super init];
    return self;
}

-(BOOL)login:(NSString *)user pass:(NSString *)pass{
    
    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:[[NSString alloc]initWithFormat:@"%@%@",ServerURL,ServerLoginCall] delegate: self] autorelease];
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    NSString *params = [[NSString alloc]initWithFormat:@"name=%@&pass=%@",user,pass];
    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
    request.httpBody = params2;
    request.contentType=@"application/x-www-form-urlencoded";
    
    
    [request sendSynchronously];
  

    
    
    return true;
}


- (NSError*)request:(TTURLRequest*)request processResponse:(NSHTTPURLResponse*)response
               data:(id)data{
    NSLog(@"sdas");
    return 0;
}

@end
