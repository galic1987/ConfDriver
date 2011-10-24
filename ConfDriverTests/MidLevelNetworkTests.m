//
//  HighLevelNetworkTests.m
//  ConfDriver
//
//  Created by Ivo Galic on 10/22/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "MidLevelNetworkTests.h"


@implementation MidLevelNetworkTests

@synthesize jsReq;

- (void)setUp
{
    [super setUp];
    XLog("<---Doing setUp--->");
    jsReq = [[JSonRequester alloc]init];
    // Set-up code here.
    //clear the cookies
    
    NSHTTPCookieStorage * sharedCookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray * cookies = [sharedCookieStorage cookies];
    for (NSHTTPCookie * cookie in cookies){
        NSLog(@"%@",cookie.domain);
        if ([cookie.domain rangeOfString:CookiesURL].location != NSNotFound){
            NSLog(@"deleting");
            [sharedCookieStorage deleteCookie:cookie];
        }
    }

}

- (void)tearDown
{
    // Tear-down code here.
    XLog("<---Doing tearDown--->");
    [super tearDown];
    TT_RELEASE_SAFELY(jsReq);

//    [[self response] release];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// TTURLRequestDelegate

-(void)testLogin{

    [jsReq.delegates addObject:self];
    [jsReq login:@"test" pass:@"test123"];
    

    
}


- (void)modelDidStartLoad:(id <TTModel>)model {
    XLog();


}

- (void)modelDidFinishLoad:(id <TTModel>)model {
    XLog();
    NSString *someString = [[NSString alloc] initWithData:[jsReq.response data] encoding:NSUTF8StringEncoding];
    
    // NSNumber* num = [self response] 
    
    NSLog(@" TTModelDelegate can see this ----------------->>> %@",someString);
}

- (void)model:(id <TTModel>)model didFailLoadWithError:(NSError *)error {
    XLog();

}

- (void)modelDidCancelLoad:(id <TTModel>)model {
    XLog();

}

///////////////////////////////////////////////////////////////////////////////////////////////////



@end
