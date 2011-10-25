//
//  Event.h
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject{
NSString* oid;
NSString* name;
NSString* label;
}

@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *label;
@property(nonatomic,retain)NSString* oid;


-(id)initWithName:(NSString *)name oid:(NSString*)oid label:(NSString*)label;

@end
