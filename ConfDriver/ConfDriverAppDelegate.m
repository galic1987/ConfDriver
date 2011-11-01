//
//  ConfDriverAppDelegate.m
//  ConfDriver
//
//  Created by Ivo Galic on 4/29/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "ConfDriverAppDelegate.h"

@implementation ConfDriverAppDelegate

@synthesize window=_window;
@synthesize startView;
@synthesize conferenceLauncher,req,navigationController;


-(void)login:(NSString *)cmd sender:(id)sender message:(NSString *)msg{
    [SingletonUser clearCookies];
    req = [[NetworkRequest alloc]init];
    [req.delegates addObject:self];
    startView.serverMessage.text = @"Connecting to server...";
    if([req login:startView.email.text pass:startView.password.text sendSynchronously:YES]){
        // login success -> switch to launcher
        conferenceLauncher = [[LauncherViewController alloc] init];
        conferenceLauncher.logdelegate = self;
        navigationController = [[UINavigationController alloc] initWithRootViewController:conferenceLauncher];
        navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
        self.window.rootViewController = navigationController;
        [_window addSubview:navigationController.view];

        XLog();
    }else{
        startView.serverMessage.text = @"Wrong email/password combination! Please try again!";
    }
    TT_RELEASE_SAFELY(req);
}

-(void)expired:(NSString *)cmd sender:(id)sender message:(NSString *)msg{
    //session expired
    [SingletonUser logout];
    XLog();
}

-(void)logout:(NSString *)cmd sender:(id)sender message:(NSString *)msg{
    [self.window.rootViewController removeFromParentViewController];
    [_window removeFromSuperview];
    [SingletonUser logout];
    
    [navigationController removeFromParentViewController];
    TT_RELEASE_SAFELY(conferenceLauncher);
    [navigationController release];
    [startView release];

    startView = [[StartUIViewController alloc] initWithNibName:@"LoginView" bundle:[NSBundle mainBundle]];
    startView.delegate = self;
    
    [_window addSubview:[startView view]];
    [_window makeKeyAndVisible];
    //logout
    XLog();
}


-(void)logout{
    [SingletonUser logout];
    [self logout:@"user invoked" sender:self message:@""];
    //logout
    XLog();
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    //self.window.rootViewController = self.tabBarController;
    startView = [[StartUIViewController alloc] initWithNibName:@"LoginView" bundle:[NSBundle mainBundle]];
    startView.delegate = self;
    
    [_window addSubview:[startView view]];
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/


// TTURLRequestDelegate
- (void)modelDidStartLoad:(id <TTModel>)model {
    XLog();
}

- (void)modelDidFinishLoad:(id <TTModel>)model {
    XLog();

}

- (void)model:(id <TTModel>)model didFailLoadWithError:(NSError *)error {
    XLog();
}

- (void)modelDidCancelLoad:(id <TTModel>)model {
    XLog();
}

@end
