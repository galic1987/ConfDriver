//
//  HighLevelNetworkTests.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/22/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <Three20/Three20.h>
#import "ServerConstants.h"
#import "JSonRequester.h"

@interface MidLevelNetworkTests : SenTestCase <TTModelDelegate> {
    JSonRequester * jsReq;
}
@property (retain,nonatomic)   JSonRequester * jsReq;

@end
