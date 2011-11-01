//
//  ParseJSonNetworkData.m
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//  

// static library used for additional

#import "ParseJSonNetworkData.h"

@implementation ParseJSonNetworkData

// LoginParserInterface
// LOGIN
+(BOOL)validateLogin:(NSData *)loginResponse{
    NSString *someString = [[NSString alloc] initWithData:loginResponse encoding:NSUTF8StringEncoding];
    XLog("-----> %@",someString);
    NSDictionary * data = (NSDictionary *)[someString JSONValue];
    //[someString release];
    if ([@"OK" isEqualToString:[data objectForKey:@"message"]]) {
        [someString release];
        return YES;
    }else{
        [someString release];
        return NO;
    }
}

+(BOOL)changeLoginObject:(NSData *)loginResponse{
    NSString *someString = [[[NSString alloc] initWithData:loginResponse encoding:NSUTF8StringEncoding]autorelease];
    NSDictionary * data = (NSDictionary *)[someString JSONValue];
    if ([@"OK" isEqualToString:[data objectForKey:@"message"]]) {
        [SingletonUser changeData:YES sessionId:[data objectForKey:@"sess_id"]];
    }else{
        [SingletonUser changeData:NO sessionId:@""];
    }
    [someString release];
    return YES;
}

+(BOOL)checkIfLogged{
    return [SingletonUser checkLogged];
}

+(BOOL)logout{
    return [SingletonUser logout];
}

// DataobjectParserInterface
// events
+(NSMutableArray *)getEventsFromResponse:(NSData *)response{
    NSString *someString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSDictionary * data = (NSDictionary *)[someString JSONValue];
    NSMutableArray * array = [[NSMutableArray alloc]init];
    for (NSDictionary* d in data){
        NSString * oid = [d objectForKey:@"oid"];
        NSString * name = [d objectForKey:@"name"];
        NSString * label = [d objectForKey:@"label"];
        XLog("\nAdding to array \nOID:%@\n NAME:%@\n LABEL:%@",oid,name,label);
        Event *ev = [[Event alloc]initWithName:name oid:oid label:label];
        [array addObject:ev];
        [ev release];
    }
    [someString release];
    return array;  
}
+(Event  *)getEventFromResponse:(NSData *)response{
    NSString *someString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSDictionary * d = (NSDictionary *)[someString JSONValue];
    NSString * oid = [d objectForKey:@"oid"];
    NSString * name = [d objectForKey:@"name"];
    NSString * label = [d objectForKey:@"label"];
    XLog("\nAdding to array \nOID:%@\n NAME:%@\n LABEL:%@",oid,name,label );
    Event *ev = [[Event alloc]initWithName:name oid:oid label:label];
    [someString release];
    return ev;
}
// reviewers
+(NSMutableArray *)getReviewersFromResponse:(NSData *)response{
    return nil;
}
// papers
+(NSMutableArray *)getPapersFromResponse:(NSData *)response{
    return nil;

}
// topics
+(NSMutableArray *)getTopicsFromResponse:(NSData *)response{
    return nil;

}
// session
+(NSMutableArray *)getSessionsFromResponse:(NSData *)response{
    return nil;

}
// criteria
+(NSMutableArray *)getCriteriaFromResponse:(NSData *)response{
    return nil;

}
// history
+(NSMutableArray *)getHistoryFromResponse:(NSData *)response{
    return nil;

}



@end

