//
//  LoginInterface.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginParserInterface <NSObject>
// LOGIN
@required
+(BOOL)validateLogin:(NSData *)loginResponse;
+(BOOL)changeLoginObject:(NSData *)loginResponse;
+(BOOL)checkIfLogged;
+(BOOL)logout;
@end
