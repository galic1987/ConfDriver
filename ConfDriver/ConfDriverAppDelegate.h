//
//  ConfDriverAppDelegate.h
//  ConfDriver
//
//  Created by Ivo Galic on 4/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartUIViewController.h"
#import "LoginProtocol.h"


@interface ConfDriverAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate,LoginProtocol> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet  StartUIViewController * startView;

@end
