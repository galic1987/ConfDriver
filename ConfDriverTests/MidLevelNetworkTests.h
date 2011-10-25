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
#import "NetworkRequest.h"

@interface MidLevelNetworkTests : SenTestCase <TTModelDelegate> {
    NetworkRequest * jsReq;
}
@property (retain,nonatomic)   NetworkRequest * jsReq;

@end
