//
//  Event.m
//  ConfDriver
//
//  Created by Ivo Galic on 10/25/11.
//  Copyright (c) 2011 Galic Design. All rights reserved.
//

#import "Event.h"

@implementation Event
@synthesize name,label,oid;

-(id)initWithName:(NSString *)name1 oid:(NSString*)oid1 label:(NSString*)label1{
    self.name = name1;
    self.oid = oid1;
    self.label = label1;
    [super init];
    return self;
}

-(oneway void)release{
    [super release];
    [self.name release];
    [self.oid release];
    [self.label release];
}

@end
