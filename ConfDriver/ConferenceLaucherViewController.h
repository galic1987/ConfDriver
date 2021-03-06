//
//  ConferenceLaucherViewController.h
//  ConfDriver
//
//  Created by Ivo Galic on 5/24/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Three20/Three20.h> // import Three20 to launcherclass
#import <Foundation/Foundation.h>
#import "LauncherViewController.h"


@interface ConferenceLaucherViewController : TTViewController<TTLauncherViewDelegate> {
    
    TTLauncherView* launcherView; //add the TTLauncherView object
    TTNavigator* navigator; //add the url navigator object
}
@end
