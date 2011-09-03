//
//  StandardTableItemCell.m
//  ConfDriver
//
//  Created by Ivo Galic on 8/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "StandardTableItemCell.h"


static const CGFloat kHPadding = 10;
static const CGFloat kVPadding = 10;
static const CGFloat kMargin = 10;
static const CGFloat kSmallMargin = 6;
static const CGFloat kSpacing = 8;
static const CGFloat kControlPadding = 8;
static const CGFloat kDefaultTextViewLines = 5;
static const CGFloat kMoreButtonMargin = 40;

static const CGFloat kKeySpacing = 12;
static const CGFloat kKeyWidth = 75;
static const CGFloat kMaxLabelHeight = 2000;
static const CGFloat kDisclosureIndicatorWidth = 23;

static const NSInteger kMessageTextLineCount = 2;

static const CGFloat kDefaultImageSize = 50;
static const CGFloat kDefaultMessageImageWidth = 34;
static const CGFloat kDefaultMessageImageHeight = 34;

@implementation StandardTableItemCell



+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)item {  
	// Set the height for the particular cell
	return 75.0;
}

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString*)identifier {
    
	if (self = [super initWithStyle:UITableViewCellStyleValue2
                    reuseIdentifier:identifier]) {
		_item = nil;
        
		_titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:17];
       

		[self.contentView addSubview:_titleLabel];
        
		_subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subtitleLabel.font = [UIFont systemFontOfSize:11];
        _subtitleLabel.lineBreakMode = UILineBreakModeWordWrap;
        _subtitleLabel.numberOfLines = 0;
        //_subtitleLabel.color = [UIColor 
		[self.contentView addSubview:_subtitleLabel];
	}
    
	return self;
}


- (void)dealloc {
	TT_RELEASE_SAFELY(_titleLabel);
	TT_RELEASE_SAFELY(_subtitleLabel);
    
	[super dealloc];
}


#pragma mark -
#pragma mark UIView

- (void)layoutSubviews {
	[super layoutSubviews];
    
	// Set the size, font, foreground color, background color, ...
    // CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
    [_titleLabel setFrame:CGRectMake(10,5,290-kHPadding,25)];
    
    [_subtitleLabel setFrame:CGRectMake(10,25,290-kHPadding,40)];
    //_subtitleLabel.color = [UIColor grayColor];
}


#pragma mark -
#pragma mark TTTableViewCell

- (id)object {
	return _item;  
}

- (void)setObject:(id)object {
	if (_item != object) {
		[super setObject:object];
        
		StandardTableItem *item = object;
        
		// Set the data in various UI elements
		[_titleLabel setText:item.title];
		[_subtitleLabel setText:item.subtitle];
        NSLog(@"- %i -",item.uid );
        //[_uid setText:item.uid];

	}
}

@end
