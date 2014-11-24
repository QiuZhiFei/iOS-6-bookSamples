//
//  AppDelegate.m
//  Ch14_14
//
//  Created by Ho Mark on 12/6/17.
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
  [self execAfter5Second];
    return YES;
}

-(void) execBlockInMainQueue {
  // 取得主執行緒的佇列
  dispatch_queue_t mainQueue = 
  dispatch_get_main_queue();
  // 建立範例的block1
  void (^loopBlock) (void) = ^{
    for (int i =0; i < 5; i++) {
      NSLog(@"某個block:block中執行了%d次",i);
    }
  };
  // 建立範例的block2
  void (^loopBlock2) (void) = ^{
    for (int i =0; i < 5; i++) {
      NSLog(@"其它的block:block中執行了%d次",i);
    }
  };
  // 準備遞交第一個block
  NSLog(@"準備提交第一個loopBlock");
  dispatch_async(mainQueue, loopBlock);
  // 準備遞交第二個block
  NSLog(@"準備提交第二個loopBlock");
  dispatch_async(mainQueue, loopBlock2);
  NSLog(@"準備執行之後的程式");
}
-(void) execBlockInGlobalQueue {
  // 取得同步執行的佇列
  dispatch_queue_t mainQueue = 
  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  // 建立範例的block1
  void (^loopBlock) (void) = ^{
    for (int i =0; i < 5; i++) {
      NSLog(@"某個block:block中執行了%d次",i);
    }
  };
  // 建立範例的block2
  void (^loopBlock2) (void) = ^{
    for (int i =0; i < 5; i++) {
      NSLog(@"其它的block:block中執行了%d次",i);
    }
  };
  // 準備遞交第一個block
  NSLog(@"準備提交第一個loopBlock");
  dispatch_async(mainQueue, loopBlock);
  // 準備遞交第二個block
  NSLog(@"準備提交第二個loopBlock");
  dispatch_async(mainQueue, loopBlock2);
  NSLog(@"準備執行之後的程式");  
}
-(void) execBlockInCustomQueue {
  // 創建一個自訂執行的同步佇列
  dispatch_queue_t mainQueue = 
  dispatch_queue_create("com.delightpress.myqueue",
                        DISPATCH_QUEUE_SERIAL );
  // 建立範例的block1
  void (^loopBlock) (void) = ^{
    for (int i =0; i < 5; i++) {
      NSLog(@"某個block:block中執行了%d次",i);
    }
  };
  // 建立範例的block2
  void (^loopBlock2) (void) = ^{
    for (int i =0; i < 5; i++) {
      NSLog(@"其它的block:block中執行了%d次",i);
    }
  };
  // 準備遞交第一個block
  NSLog(@"準備提交第一個loopBlock");
  dispatch_sync(mainQueue, loopBlock);
  // 準備遞交第二個block
  NSLog(@"準備提交第二個loopBlock");
  dispatch_sync(mainQueue, loopBlock2);
  NSLog(@"準備執行之後的程式");  
}

-(void) execBlockSerialBlock {
  // 創建一個自訂執行的同步佇列
  dispatch_queue_t myQueue = 
  dispatch_queue_create("com.delightpress.myqueue",
                        DISPATCH_QUEUE_CONCURRENT );  
  // 實作一個印出echo~~的block
  void (^echoBlock) (void) = ^{
    NSLog(@"echo~~");
  };

  // 建立範例的loopBlock
  // 在這個block之中再呼叫dispatch_async
  void (^loopBlock) (void) = ^{
    NSLog(@"say~~");
    // 使用dispatch_async將echoBlock
    // 送進myQueue
    dispatch_sync(myQueue, echoBlock);
    NSLog(@"finish echo");
  };
  NSLog(@"準備提交loopBlock");
  dispatch_sync(myQueue, loopBlock);
}
-(void) execSyncInMainQueue {
  // 取得主執行緒
  dispatch_queue_t myQueue = 
  dispatch_get_current_queue();
  // 實作一個簡單的block
  void (^echoBlock) (void) = ^{
    NSLog(@"echo~~");
  };
  NSLog(@"準備在主執行緒底下呼叫dispatch_sync");
  dispatch_sync(myQueue, echoBlock);
}

-(void) execApply {
  // 創建一個自訂執行的同步佇列
  dispatch_queue_t myQueue = 
  dispatch_queue_create("com.delightpress.myqueue",
                        DISPATCH_QUEUE_SERIAL );
  // 切成8份
  dispatch_apply(8, myQueue, ^(size_t idx) {
    for (int i=0; i < 10; i++) {
      // 換算回原來的索引
      int processIdx = idx*10+i;
      NSLog(@"第%lu份迭代，實際索引為%d",idx,processIdx);
    }
  });
  NSLog(@"運算完成");
}
-(void) execAfter5Second {
  // 創建一個自訂執行的同步佇列
  dispatch_queue_t myQueue = 
  dispatch_queue_create("com.delightpress.myqueue",
                        DISPATCH_QUEUE_CONCURRENT );
  // 實作一個簡單的block
  void (^echoBlock) (void) = ^{
    NSLog(@"echo~~");
  };
  // 使用NSLog紀錄開始的時間
  NSLog(@"開始準備dispatch_after指令");
  // 產生一組五秒之後的block呼叫
  dispatch_after(
  dispatch_time(DISPATCH_TIME_NOW, 5*NSEC_PER_SEC), 
                 myQueue, echoBlock);
  NSLog(@"執行其它程式碼");
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
