//
//  ConfDriverTests.h
//  ConfDriverTests
//
//  Created by Ivo Galic on 4/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>



@interface ConfDriverTests : SenTestCase <TTURLRequestDelegate>{
    TTURLDataResponse *response;
@private
    
}
@property (retain,nonatomic) TTURLDataResponse *response;
@end
