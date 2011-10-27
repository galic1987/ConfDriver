//
//  StandardTableDataSource.m
//  ConfDriver
//
//  Created by Ivo Galic on 8/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "StandardTableDataSource.h"


@implementation StandardTableDataSource

- (id)init {
	if (self = [super init]) {
        
        self.items = [[NSMutableArray alloc] init]; 
        
    
		self.items = [NSArray arrayWithObjects:
                      [StandardTableItem itemWithTitle:@"First" subtitle:@"Hello #1! -----" uid:2],
                      [StandardTableItem itemWithTitle:@"Second" subtitle:@"Hello #2!----- kasfisaf viafjasoifasiovaj osidjasi some long boring text that initiates my bornines by all respect" uid:1],
                      [StandardTableItem itemWithTitle:@"Third" subtitle:@"Hello #3!" uid:3],
                      [StandardTableItem itemWithTitle:@"Fourth" subtitle:@"Hello #4!" uid:4],
                      [StandardTableItem itemWithTitle:@"Fifth" subtitle:@"Hello #5!" uid:5],
                      nil];
        
	}
    
	return self;
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {
    
	if ([object isKindOfClass:[StandardTableItem class]]) {  
		return [StandardTableItemCell class];  
	}
    
	return [super tableView:tableView
	     cellClassForObject:object];
}

@end