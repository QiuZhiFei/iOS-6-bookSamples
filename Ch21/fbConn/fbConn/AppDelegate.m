//
//  AppDelegate.m
//  fbConn
//
//  Created by Ho Mark on 12/7/30.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize facebook;

-(void) getFacebookStatus {
  // 先從使用者偏好中檢查
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  // 如果之前有登入的紀錄
  if ([defaults objectForKey:@"FBAccessTokenKey"]
      && [defaults objectForKey:@"FBExpirationDateKey"]) {
    // 就直接設定Facebook的登入紀錄
    facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
    facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
  }
  // 如果沒有合適的session
  // 就執行驗証
  if (![facebook isSessionValid]) {
    [facebook authorize:nil];
  }
}
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // 在應用程式開始時，初始化這個facebook的變數
  facebook = [[Facebook alloc]
              initWithAppId:@"163261947143100"
              andDelegate:self];
  return YES;
}
- (void)dealloc
{
  [_window release];
    [super dealloc];
}

- (void)fbDidLogin {
  // 取得使用者偏好
  NSUserDefaults *defaults =
  [NSUserDefaults standardUserDefaults];
  // 將存取代碼和逾時資訊存入
  [defaults setObject:
   [facebook accessToken] forKey:@"FBAccessTokenKey"];
  [defaults setObject:
   [facebook expirationDate] forKey:@"FBExpirationDateKey"];
  [defaults synchronize];
  // 放出登入成功
  [[NSNotificationCenter defaultCenter]
   postNotificationName:@"loginSuccess" object:nil];
  
}

- (void) fbDidLogout {
  // 如果有存在紀錄，則清空
  NSUserDefaults *defaults =
  [NSUserDefaults standardUserDefaults];
  if ([defaults objectForKey:@"FBAccessTokenKey"]) {
    [defaults
     removeObjectForKey:@"FBAccessTokenKey"];
    [defaults
     removeObjectForKey:@"FBExpirationDateKey"];
    [defaults synchronize];
  }
  // 放出登出成功
  [[NSNotificationCenter defaultCenter]
   postNotificationName:@"logoutSuccess" object:nil];
}

-(BOOL) application:(UIApplication*) application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
  // 呼叫facebook物件來處理這個回傳的URL
  NSLog(@"handleing url with ");
   return [facebook handleOpenURL:url]; 
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
  NSLog(@"view will become foreground again");
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
