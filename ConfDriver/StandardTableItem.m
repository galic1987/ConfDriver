//
//  StandardTableCell.m
//  ConfDriver
//
//  Created by Ivo Galic on 8/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "StandardTableItem.h"


@implementation StandardTableItem
@synthesize title = _title, subtitle = _subtitle, uid = _uid;


+ (id)itemWithTitle:(NSString *)title
           subtitle:(NSString *)subtitle
                uid:(int)uid{
    
	StandardTableItem *item = [[[self alloc] init] autorelease];
	item.title = title;
	item.subtitle = subtitle;
    item.uid = uid;
    
	return item;
}


#pragma mark -
#pragma mark NSObject

- (id)init {  
	if (self = [super init]) {  
		_title = nil;
		_subtitle = nil;
       // _uid = nil;
	}
    
	return self;
}


- (void)dealloc {  
	TT_RELEASE_SAFELY(_title);
	TT_RELEASE_SAFELY(_subtitle);
   // TT_RELEASE_SAFELY(_uid);

	[super dealloc];
}

#pragma mark -
#pragma mark NSCoding

- (id)initWithCoder:(NSCoder*)decoder {
    if (self = [super initWithCoder:decoder]) {  
        self.title = [decoder decodeObjectForKey:@"title"];
        self.subtitle = [decoder decodeObjectForKey:@"subtitle"];
      //  self.uid = [decoder decodeObjectForKey:@"uid"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder {  
    [super encodeWithCoder:encoder];
    
    if (self.title) {
        [encoder encodeObject:self.title
                       forKey:@"title"];
    }
    if (self.subtitle) {
        [encoder encodeObject:self.subtitle
                       forKey:@"subtitle"];
    }
//    if (self.uid) {
//        [encoder encodeObject:self.subtitle
//                       forKey:@"uid"];
//    }
}

@end