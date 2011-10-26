//
//  SingletonUser.m
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

//persisting singelton object

#import "SingletonUser.h"

@implementation SingletonUser

static BOOL loggedin;
static SingletonUser *sharedSingleton;
static NSString *sessid;

+ (BOOL)clearCookies{
    NSHTTPCookieStorage * sharedCookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray * cookies = [sharedCookieStorage cookies];
    for (NSHTTPCookie * cookie in cookies){
        if ([cookie.domain rangeOfString:CookiesURL].location != NSNotFound){
            NSLog(@"deleting cookies");
            [sharedCookieStorage deleteCookie:cookie];
            return true;
        }
    }
    return false;
}

+ (BOOL)logout{
    loggedin = NO;
    //clear the cookies
    [self clearCookies];
    return false;
    
}

+ (void)initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        loggedin = NO;
        sharedSingleton = [[SingletonUser alloc] init];
    }
}

+ (SingletonUser *)changeData:(BOOL)logged sessionId:(NSString*)sessionId;
{
    
    @synchronized(self)
    {
        loggedin = logged;
        sessid = sessionId;
        if (!sharedSingleton)
            sharedSingleton = [[SingletonUser alloc] init];
        
        return sharedSingleton;
    }
}

+ (BOOL)checkLogged{
    return loggedin;
}

@end
