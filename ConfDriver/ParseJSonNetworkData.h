//
//  ParseJSonNetworkData.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginParserInterface.h"

@interface ParseJSonNetworkData : NSObject <LoginParserInterface>{
    
}

// LOGIN
+(BOOL)validateLogin:(NSString *)loginResponse;
+(BOOL)changeLoginObject:(NSString *)loginResponse;
+(BOOL)checkIfLogged;
+(BOOL)logout;

// EVENTS


// PAPERS


// 


@end
