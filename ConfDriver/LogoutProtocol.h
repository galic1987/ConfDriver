//
//  LogoutProtocol.h
//  ConfDriver
//
//  Created by Ivo Galic on 11/1/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LogoutProtocol <NSObject>
-(void)logout:(NSString *)cmd sender:(id)sender message:(NSString *)msg;

@end
