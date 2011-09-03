//
//  MainEventsController.m
//  ConfDriver
//
//  Created by Ivo Galic on 8/28/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "MainEventsController.h"


@implementation MainEventsController

///////////////////////////////////////////////////////////////////////////////////////////////////
// private

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    self.tableViewStyle = UITableViewStyleGrouped;
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

- (void)loadView {
    [super loadView];
}

- (void) createModel {
//    MockDataSource *ds = [[MockDataSource alloc] init];
//    ds.addressBook.fakeLoadingDuration = 1.0;
//    self.dataSource = ds;
//    [ds release];
    StandardTableDataSource *sc = [[StandardTableDataSource alloc] init];
    self.dataSource = sc;
    [sc release];
    
}

- (id<TTTableViewDelegate>) createDelegate {
    
    TTTableViewDragRefreshDelegate *delegate = [[TTTableViewDragRefreshDelegate alloc] initWithController:self];
    
    return [delegate autorelease];
}
@end
