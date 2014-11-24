//
//  AppDelegate.m
//  Ch3_1
//
//  Created by Ho Mark on 12/3/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    NSLog(@"初始化的執行完成");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"這個應用程式要離開前景了");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"這個應用程式進入背景了，可以在工作列找到");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"應用程式即將進入前景");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"進入前景準備接受使用者的命令");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"應用程式即將終止，需要作狀態的暫存");
}

-(BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    // 取得來源應用程式的列表
    NSLog(@"從%@傳來的呼叫",sourceApplication);
    // 取得URL的字串
    NSLog(@"傳入的URL是 %@",url);
    return YES;
}

- (void) applicationDidReceiveMemoryWarning:(UIApplication *)application {
    exit(0);
}

@end
