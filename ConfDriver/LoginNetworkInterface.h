//
//  LoginNetworkInterface.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginNetworkInterface <NSObject>
@required
    -(BOOL)login:(NSString *)user pass:(NSString *)pass sendSynchronously:(BOOL)sendSynchronously;
    -(BOOL)logout:(BOOL)sendSynchronously;
    -(BOOL)checkIfLogged:(BOOL)sendSynchronously;


@end
