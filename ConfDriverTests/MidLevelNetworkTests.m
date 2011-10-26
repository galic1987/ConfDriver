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
    jsReq = [[NetworkRequest alloc]init];
    [jsReq.delegates addObject:self];

    // Set-up code here.
    //clear the cookies
    [SingletonUser clearCookies];

}

- (void)tearDown
{
    // Tear-down code here.
    XLog("<---Doing tearDown--->");
    [super tearDown];
    TT_RELEASE_SAFELY(jsReq);

}

// TESTS START

-(void)testLogin{
    STAssertEquals([jsReq login:@"test" pass:@"test123" sendSynchronously:YES],YES,@"Should return TRUE if logged in");
}


-(void)testLogin_ShouldFail{
    STAssertEquals([jsReq login:@"test31231" pass:@"not Correct" sendSynchronously:YES],NO,@"Should return FALSE ");
}

-(void)testgetEventsDataAndParseItToArrayObjects{
    STAssertEquals([jsReq login:@"test" pass:@"test123" sendSynchronously:YES],YES,@"Should return TRUE if logged in");
    [jsReq release];
    
    jsReq = [[NetworkRequest alloc]init];
    NSArray *r = (NSArray *)[jsReq getEventsById:@"149" sendSynchronously:YES]; // getArrayOfEventObject
    
    NSEnumerator * enumerator = [r objectEnumerator];
    Event * element;
    
    while(element = [enumerator nextObject])
    {
        // Do your thing with the object.
        XLog("Listing array \nOID:%@\n NAME:%@\n LABEL:%@",element.oid,element.name,element.label );
    }
}

-(void)testLogout{
    STAssertEquals([jsReq login:@"test" pass:@"test123" sendSynchronously:YES],YES,@"Should return TRUE if logged in");
    [jsReq release];
    jsReq = [[NetworkRequest alloc]init];

    [jsReq logout:YES];
    [jsReq release];
    jsReq = [[NetworkRequest alloc]init];

    STAssertEquals([jsReq login:@"test" pass:@"test123" sendSynchronously:YES],YES,@"Should return TRUE if logged in");
    XLog(@"fail");
    [jsReq release];
    jsReq = [[NetworkRequest alloc]init];
    STAssertEquals([jsReq login:@"test" pass:@"test123" sendSynchronously:YES],NO,@"Cant be loggedin 2 times");

}

-(void)testgetEventsDataAndParseItToArrayObjects_shouldFail{
   STAssertEquals([jsReq login:@"test" pass:@"test123" sendSynchronously:YES],YES,@"Should return TRUE if logged in");
    [jsReq release];
    
    jsReq = [[NetworkRequest alloc]init];
    NSArray *r = [jsReq getEventsById:@"149" sendSynchronously:YES]; // getArrayOfEventObject
    //STAssertNil(r, @"nil is not right");
    NSEnumerator * enumerator = [r objectEnumerator];
    Event * element;
    
    while(element = [enumerator nextObject])
    {
        // Do your thing with the object.
        XLog("Listing array \nOID:%@\n NAME:%@\n LABEL:%@",element.oid,element.name,element.label );
    }
    XLog();
}


// TEST END




///////////////////////////////////////////////////////////////////////////////////////////////////
// TTURLRequestDelegate
- (void)modelDidStartLoad:(id <TTModel>)model {
    XLog();
}

- (void)modelDidFinishLoad:(id <TTModel>)model {
    XLog();
    NSString *someString = [[NSString alloc] initWithData:[jsReq.response data] encoding:NSUTF8StringEncoding];
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
