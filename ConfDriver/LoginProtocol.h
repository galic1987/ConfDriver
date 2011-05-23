//
//  LoginProtocol.h
//  ConfDriver
//
//  Created by Ivo Galic on 5/23/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol LoginProtocol <NSObject>
//login call
-(void)login:(NSString *)cmd sender:(id)sender message:(NSString *)msg;
//session expired
-(void)expired:(NSString *)cmd sender:(id)sender message:(NSString *)msg; 
//logout
-(void)logout:(NSString *)cmd sender:(id)sender message:(NSString *)msg;
@end
