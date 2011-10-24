//
//  ServerConstants.m
//  ConfDriver
//
//  Created by Ivo Galic on 9/4/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "ServerConstants.h"


// server url where confDriver server is located
NSString * const ServerURL = @"http://webcampus.ifs.tuwien.ac.at/confdriver";
NSString * const ServerLoginCall = @"/member/login"; // params user and pass
NSString * const ServerLogoutCall = @"/member/logout";
NSString * const ServerEventCall = @"/service/events/"; // +event number
NSString * const CookiesURL = @".webcampus.ifs.tuwien.ac.at"; // cookies url prefix
