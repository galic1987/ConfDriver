//
//  StandardTableItemCell.h
//  ConfDriver
//
//  Created by Ivo Galic on 8/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardTableItem.h"

@interface StandardTableItemCell : TTTableLinkedItemCell {
	UILabel *_titleLabel;
	UILabel *_subtitleLabel;
}

@end