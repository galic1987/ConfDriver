//
//  SingletonUser.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerConstants.h"

@interface SingletonUser : NSObject{
}
+ (SingletonUser *)changeData:(BOOL)logged sessionId:(NSString*)sessionId;
+ (BOOL)checkLogged;
+ (BOOL)clearCookies;
+ (BOOL)logout;
@end
