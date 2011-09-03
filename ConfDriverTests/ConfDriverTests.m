//
//  ConfDriverTests.m
//  ConfDriverTests
//
//  Created by Ivo Galic on 4/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "ConfDriverTests.h"


@implementation ConfDriverTests
@synthesize response;
- (void)setUp
{
    [super setUp];
    XLog("-----------------------------------------------");

    // Set-up code here.
    self.response = [[TTURLDataResponse alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


- (void)testParseLoginDataJSon
{
    NSString * loginDataJSon = @"{\"message\":\"OK\",\"sess_name\":\"SESS7d56d413b913312aa59c45c88aa7e988\",\"sess_id\":\"KBhaqOFmxkPiJNBN53jYlKHh4RLliAL03Ifm0XxQezk\"}";
    NSDictionary * data = (NSDictionary *)[loginDataJSon JSONValue];
    NSString * sess = [data objectForKey:@"sess_name"];
    STAssertEqualObjects(sess, @"SESS7d56d413b913312aa59c45c88aa7e988", @"WTF");
    STAssertEqualObjects(@"OK", [data objectForKey:@"message"], @"WTF");
    STAssertEqualObjects(@"KBhaqOFmxkPiJNBN53jYlKHh4RLliAL03Ifm0XxQezk", [data objectForKey:@"sess_id"], @"WTF");

    //XLog("SESSION NAME %@", sess);
}

- (void)testParseGetSome
{
    
    
}


- (void)test1Login
{
    //STFail(@"Unit tests are not implemented yet in ConfDriverTests");
     
    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:@"http://webcampus.ifs.tuwien.ac.at/confdriver/member/login" delegate: self] autorelease];
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    NSString *params = @"name=test&pass=test123";
    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
    request.httpBody = params2;
    request.contentType=@"application/x-www-form-urlencoded";


    [request sendSynchronously];
    
 NSString *someString = [[NSString alloc] initWithData:[[self response]data] encoding:NSASCIIStringEncoding];
    
    NSLog(@"%@",someString);
    
   
    NSDictionary *dict = [someString JSONValue];
    
    for (NSDictionary* d in dict){
        XLog("---->");
    }
}

- (void)test2GetData
{
    //STFail(@"Unit tests are not implemented yet in ConfDriverTests");
    
    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:@"http://webcampus.ifs.tuwien.ac.at/confdriver/service/events/149" delegate: self] autorelease];
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
//    NSString *params = @"name=test&pass=test123";
//    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
//    request.httpBody = params2;
    request.contentType=@"application/x-www-form-urlencoded";
    
    
    [request sendSynchronously];
    
    NSString *someString = [[NSString alloc] initWithData:[[self response]data] encoding:NSASCIIStringEncoding];
    
    NSLog(@"Array %@",someString);
    
    
    NSDictionary *dict = [someString JSONValue];
    
    for (NSDictionary* d in dict){
        XLog("---->");
        NSString * oid = [d objectForKey:@"oid"];
        NSString * name = [d objectForKey:@"name"];
        NSString * label = [d objectForKey:@"label"];

        XLog("\nOID:%@\n NAME:%@\n LABEL:%@",oid,name,label );
    }
}


- (void)test3Logout
{
    //STFail(@"Unit tests are not implemented yet in ConfDriverTests");
    
    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:@"http://webcampus.ifs.tuwien.ac.at/confdriver/member/logout" delegate: self] autorelease];
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    //    [request.parameters setObject:@"test" forKey:@"name"];
    //    [request.parameters setObject:@"test123" forKey:@"password"];
    NSString *params = @"name=test&pass=test123";
    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
    request.httpBody = params2;
    request.contentType=@"application/x-www-form-urlencoded";
    
    
    [request sendSynchronously];
    
    NSString *someString = [[NSString alloc] initWithData:[[self response]data] encoding:NSASCIIStringEncoding];
    
    NSLog(@"%@",someString);

}

- (void)requestDidFinishLoad:(TTURLRequest*)request{
    XLog("-----------------------------------------------");
}


@end
