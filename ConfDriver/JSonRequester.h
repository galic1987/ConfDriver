//
//  JSonRequester.h
//  ConfDriver
//
//  Created by Ivo Galic on 8/26/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>
#import "ServerConstants.h"

@interface JSonRequester : TTURLRequestModel <TTURLResponse>{
    //TTURLRequest *loadingRequest;
    TTURLDataResponse *response;
    NSString* downloadUrl;

}
//@property (nonatomic,retain)  TTURLRequest *_loadingRequest;
@property (nonatomic,retain)  TTURLDataResponse *response;
@property (nonatomic, assign) NSString* downloadUrl;


-(BOOL)login:(NSString *)user pass:(NSString *)pass;
@end
