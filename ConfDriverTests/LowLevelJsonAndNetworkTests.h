//
//  ConfDriverTests.h
//  ConfDriverTests
//
//  Created by Ivo Galic on 4/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <Three20/Three20.h>
#import "ServerConstants.h"
#import "SBJson.h"
#import "SBJsonParser.h"
#import "ServerConstants.h"
#import "JSonRequester.h"


@interface LowLevelJsonAndNetworkTests : SenTestCase <TTURLRequestDelegate,TTURLResponse>{
    TTURLDataResponse *response;
@private
}
@property (retain,nonatomic) TTURLDataResponse *response;

@end 
