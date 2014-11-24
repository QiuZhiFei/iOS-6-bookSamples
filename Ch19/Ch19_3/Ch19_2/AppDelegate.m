//
//  AppDelegate.m
//  Ch19_2
//
//  Created by Ho Mark on 12/7/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize externalWindow;
@synthesize window = _window;

- (void)dealloc
{
  [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
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

-(void) detechExternalScreen {
  // 將兩個變數先設為nil
  externalWindow = nil;
  externalScreen = nil;
  if ([[UIScreen screens] count] > 1) {
		
		// 內建的營幕是第0個，外部的是第一個
		externalScreen = [[[UIScreen screens] objectAtIndex:1] retain];
		// 取得營幕正確的解析度
		NSArray* screenModes = externalScreen.availableModes;
		UIAlertView *alert = 
    [[[UIAlertView alloc] initWithTitle:@"外接的營幕營幕" 
                                message:@"支援的解析度是" 
                               delegate:self 
                      cancelButtonTitle:nil 
                      otherButtonTitles:nil] autorelease];
    // 將有效營幕解析度
		for (UIScreenMode *screenMode in screenModes) {
			CGSize modeScreenSize = screenMode.size;
			[alert addButtonWithTitle:[NSString stringWithFormat:@"%.0f x %.0f像素", modeScreenSize.width, modeScreenSize.height]];
		}
		[alert show];
	} else {
    NSLog(@"偵測結果沒有外部營幕");
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  // 取得目前的組態
  UIScreenMode* currentMode = 
  [externalScreen.availableModes objectAtIndex:buttonIndex];
  // 初始化外部營幕 
  [self initExternalScreenWithWidth: currentMode.size.width 
                          AndHeight:currentMode.size.height];
}

-(void)initExternalScreenWithWidth: (int) width AndHeight:(int) height {
  // 從傳入的解析度初始化外部營幕
  externalWindow = 
  [[UIWindow alloc]initWithFrame:CGRectMake(0,0,width, height)];
  // 將externalScreen指定給這個externalWindow的screen屬性 
  externalWindow.screen = externalScreen;
  // 釋放externalScreen變數
  [externalScreen release];
  // 設定外部營幕為可視
  externalWindow.hidden = NO;
	[externalWindow makeKeyAndVisible];
  // 初始化外部營幕的底色
  externalWindow.backgroundColor = 
  [UIColor colorWithRed:1.0 green:0.4 blue:0.4 alpha:1.0];
  // 將標籤設定為300*80，並且放在畫面的正中間
  UILabel* label = 
  [[UILabel alloc] 
   initWithFrame:CGRectMake(width/2-240, height/2-40, 480, 80)];
  // 設定label的內容
  label.text = 
  [NSString stringWithFormat:@"外接營幕的尺寸是 %dx%d",width,height];
  // 加到externalWindow上
  [externalWindow addSubview:label];
  // 設定label的屬性
  label.backgroundColor = [UIColor clearColor];
  label.textColor = [UIColor whiteColor];
  label.shadowColor = [UIColor grayColor];
  label.font = [UIFont systemFontOfSize:36];
  label.numberOfLines = 0;
  [label release];
}

@end
