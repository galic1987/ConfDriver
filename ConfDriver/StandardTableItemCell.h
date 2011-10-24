//
//  StandardTableItemCell.h
//  ConfDriver
//
//  Created by Ivo Galic on 8/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import "StandardTableItem.h"


@interface StandardTableItemCell : TTTableLinkedItemCell {
	UILabel *_titleLabel;
	UILabel *_subtitleLabel;
}

@end