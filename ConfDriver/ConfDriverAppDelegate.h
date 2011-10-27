//
//  ConfDriverAppDelegate.h
//  ConfDriver
//
//  Created by Ivo Galic on 4/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StartUIViewController.h"
#import "LoginProtocol.h"
#import "LauncherViewController.h"
#import "NetworkRequest.h"
#import "ParseJSonNetworkData.h"
#import "SingletonUser.h"


@interface ConfDriverAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate,LoginProtocol,TTModelDelegate> {
    LauncherViewController *conferenceLauncher;
    NetworkRequest *req;
    UINavigationController *navigationController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) LauncherViewController *conferenceLauncher;
@property (nonatomic, retain) NetworkRequest *req;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet  StartUIViewController * startView;

-(void)logout;
@end
