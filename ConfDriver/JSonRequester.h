//
//  JSonRequester.h
//  ConfDriver
//
//  Created by Ivo Galic on 8/26/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface JSonRequester : NSObject {
    TTURLRequest *request;
}
@property (nonatomic,retain)  TTURLRequest *request;
-(NSMutableArray *)login:(NSString *)user pass:(NSString *)pass;
@end
