//
//  StandardTableCell.h
//  ConfDriver
//
//  Created by Ivo Galic on 8/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StandardTableItem : TTTableLinkedItem {
	NSString *_title;
	NSString *_subtitle;
    int uid;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic) int uid;


+ (id)itemWithTitle:(NSString *)title
           subtitle:(NSString *)subtitle
                uid:(int)uid;

@end

