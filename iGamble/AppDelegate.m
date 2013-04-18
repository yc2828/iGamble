//
//  AppDelegate.m
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIImage *navBack = [UIImage imageNamed:@"nav-bar-back.png"];
    [[UINavigationBar appearance] setBackgroundImage:navBack forBarMetrics: UIBarMetricsDefault];
    UIImage *tabBack = [UIImage imageNamed:@"tab-bar-back.png"];
    [[UITabBar appearance] setBackgroundImage:tabBack];
    
    UIImage *backButton = [UIImage imageNamed:@"back-button"];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButton forState:normal barMetrics:UIBarMetricsDefault];
    UIImage *navButton = [UIImage imageNamed:@"nav-button-sq"];
    [[UIBarButtonItem appearance] setBackgroundImage:navButton forState:normal barMetrics:UIBarMetricsDefault];
    
    AppInfo *appInfo = [AppInfo getInstance];
    User *user = [[User alloc] init];
    user.userId = 1;
    user.firstName = @"Paul";
    user.lastName = @"Chen";
    user.balance = 2024;
    appInfo.currentUser = user;
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
