//
//  ConfDriverTests.m
//  ConfDriverTests
//
//  Created by Ivo Galic on 4/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "LowLevelJsonAndNetworkTests.h"


@implementation LowLevelJsonAndNetworkTests


@synthesize response;

- (void)setUp
{
    [super setUp];
    XLog("<---Doing setUp--->");
    // Set-up code here.
    self.response = [[[TTURLDataResponse alloc] init] autorelease];
                    
    //data = [[NSData alloc]init];
}

- (void)tearDown
{
    // Tear-down code here.
    XLog("<---Doing tearDown--->");
    [super tearDown];
    [[self response] release];
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

//- (void)test0LoginFail
//{
//    //STFail(@"Unit tests are not implemented yet in ConfDriverTests");
//    NSString * url = [[NSString alloc]initWithFormat:@"%@%@",ServerURL,ServerLoginCall];
//    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:url delegate: self] autorelease];
//    [request setResponse:self.response];
//    request.httpMethod = @"POST";
//    request.cachePolicy = TTURLRequestCachePolicyNoCache;
//    NSString *params = @"name=test&pass=test1233";
//    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
//    request.httpBody = params2;
//    request.contentType=@"application/x-www-form-urlencoded";
//    
//    [request sendSynchronously];
//        
//    NSString *someString = [[NSString alloc] initWithData:[[self response]data] encoding:NSUTF8StringEncoding];
//    
//    // NSNumber* num = [self response] 
//    
//    NSLog(@"%@",someString);
//    
//    NSString *dataString = [[NSString alloc] 
//                            initWithData:[[self response]data]
//                            encoding:NSUTF8StringEncoding];
//     
//    NSDictionary *dict = (NSDictionary *)[someString JSONValue];
//    
//    NSLog(@" NewsID : %@", dict);
//    NSLog(@" NewsID : %@", [dict objectForKey:@"message"]);
//
////        for (NSString* d in dict){
////            XLog("Login params %@", d);
////        }
//
//    
//    
//}


- (void)test1LoginSuccess
{
    

    //STFail(@"Unit tests are not implemented yet in ConfDriverTests");
    NSString * url = [[NSString alloc]initWithFormat:@"%@%@",ServerURL,ServerLoginCall];
    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:url delegate: self] autorelease];
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
    NSString *params = @"name=test&pass=test123";
    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
    request.httpBody = params2;
    request.contentType=@"application/x-www-form-urlencoded";


    [request sendSynchronously];
        
    NSString *someString = [[NSString alloc] initWithData:[[self response]data] encoding:NSUTF8StringEncoding];
    
   // NSNumber* num = [self response] 
    
    NSLog(@" ----------------- %@",someString);
    
    
   
       someString = [someString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        //SBJsonParser * parser = [[SBJsonParser alloc] init];
            
       // NSMutableDictionary *dict =[parser objectWithData:[[self response]data]];
        
        NSDictionary *dict = [someString JSONValue];
//         NSString * sess = [dict objectForKey:@"sess_name"];
//        XLog("SESS %@ " , sess);
//        
//        for (NSString* d in dict){
//            NSString * sess1 = [dict objectForKey:@"sess_name"];
//            XLog("SESS1 %@ " , sess1);
//            XLog("Login params %@ ",d);
//        }
        
        for (id key in dict) {
            
            NSLog(@"key: %@, value: %@", key, [dict objectForKey:key]);
            
        }
        

   

}

- (void)test2GetData
{
    //STFail(@"Unit tests are not implemented yet in ConfDriverTests");
    NSString * url = [[NSString alloc]initWithFormat:@"%@%@%@",ServerURL,ServerEventsByEventIdCall,@"149"];

    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:url delegate: self] autorelease];
    [request setResponse:self.response];
    request.httpMethod = @"POST";
    request.cachePolicy = TTURLRequestCachePolicyNoCache;
//    NSString *params = @"name=test&pass=test123";
//    NSData* params2= [params dataUsingEncoding: NSASCIIStringEncoding];
//    request.httpBody = params2;
    request.contentType=@"application/x-www-form-urlencoded";
    
    
    [request sendSynchronously];
    
    NSString *someString = [[NSString alloc] initWithData:[[self response]data] encoding:NSUTF8StringEncoding];
    
    //NSLog(@"Array %@",someString);
    
    
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
    NSString * url = [[NSString alloc]initWithFormat:@"%@%@",ServerURL,ServerLogoutCall];

    TTURLRequest *request = [[[TTURLRequest alloc] initWithURL:url delegate: self] autorelease];
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
    
    NSString *someString = [[NSString alloc] initWithData:[[self response]data] encoding:NSUTF8StringEncoding];
    
    NSLog(@"********* %@",someString);

}
- (NSError*)request:(TTURLRequest*)request processResponse:(NSHTTPURLResponse*)response
               data:(id)data{
    // XLog("###############################################");
    NSLog(@"%i",[response statusCode]);
    NSString *someString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    //NSLog(@"Response %@",someString);

}

- (void)requestDidFinishLoad:(TTURLRequest*)request{
    //XLog("----------------------------------------------->");
}


@end
