//
//  AppDelegate.m
//  Ch10_2
//
//  Created by Ho Mark on 12/4/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
  [_window release];
  [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  // Override point for customization after application launch.
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
  } else {
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil] autorelease];
  }
  self.window.rootViewController = self.viewController;
  // 新增使用者偏好的變更告知
  [[NSNotificationCenter defaultCenter] addObserver:self 
      selector:@selector(handleChangeInUserSettings) 
      name:NSUserDefaultsDidChangeNotification object:nil];
 
  
  [self.window makeKeyAndVisible];
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
  [self printUserDefault];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) printUserDefault {
  // 取得使用者偏好的實例
  NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
  // 取得Name的文字欄位使用者偏好值
  NSString* username = [userDefaults stringForKey:@"name_preference"];
  NSLog(@"Name值對應的是：%@",username);
  //取得Password的文字欄位使用者偏好
  NSString* password = [userDefaults stringForKey:@"password_preference"];
  NSLog(@"Password值對應的是：%@",password);
  // Auto Login是一個toggle switch，使用bool去接收它的值
  BOOL is_autologin = [userDefaults boolForKey:@"is_autologin"];
  NSLog(@"Auto Login值對應的是:%d",is_autologin);
  // Color是一個多重選單，使用NSInteger去接收它的值
  NSInteger color_preference = [userDefaults integerForKey:@"color_preference"];
  NSLog(@"Color選單對應的是:%d",color_preference);
  // Location是一個文字標籤，使用NSInteger接收
  NSInteger store_location = [userDefaults integerForKey:@"store_location"];
  NSLog(@"Location標籤的值對應的索引是:%d",store_location);
  // Image Size是一個滑桿，使用浮點數來接收
  double slider_preference = [userDefaults floatForKey:@"slider_preference"];
  NSLog(@"Image Size滑桿對應的索引是:%f",slider_preference);
}
-(void) handleChangeInUserSettings {
  NSLog(@"使用者偏好已經變更");
  [self printUserDefault];
  
}
@end
