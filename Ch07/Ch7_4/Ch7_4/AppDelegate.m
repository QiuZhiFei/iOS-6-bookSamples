//
//  AppDelegate.m
//  Ch7_4
//
//  Created by Ho Mark on 12/4/2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"

#import "SecondViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize navigationController;
@synthesize currentValue;
- (void)dealloc
{
  [_window release];
  [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  // Override point for customization after application launch.
  UIViewController *viewController1, *viewController2;
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    viewController1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController_iPhone" bundle:nil] autorelease];
    viewController2 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController_iPhone" bundle:nil] autorelease];
  } else {
    viewController1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController_iPad" bundle:nil] autorelease];
    viewController2 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController_iPad" bundle:nil] autorelease];
  }
  self.tabBarController = [[[UITabBarController alloc] init] autorelease];
  self.tabBarController.title = @"標籤列的根控制項";
  // 初始化UINavigationController;
  navigationController = [[UINavigationController alloc]initWithRootViewController:self.tabBarController];
  self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, nil];
  self.window.rootViewController = navigationController; //self.tabBarController;
  [self.window makeKeyAndVisible];
  
  currentValue = @"some common data...";
  
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

@end
