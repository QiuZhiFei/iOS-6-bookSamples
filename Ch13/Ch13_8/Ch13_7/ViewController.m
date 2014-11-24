//
//  ViewController.m
//  Ch13_7
//
//  Created by Ho Mark on 12/6/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // 設定m_progress的初始值為0
  m_progressBar.progress = 0;
}

- (void)viewDidUnload
{
    [m_progressBar release];
    m_progressBar = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void) doFiveTimesPerSecond:(NSTimer*)timer {
  // 如果progres bar是滿的就清空
  if (m_progressBar.progress >= 1.0) {
    m_progressBar.progress = 0;
    return;
  }
  // 每次增加1/20
  m_progressBar.progress += 0.05;
}
- (IBAction)startButtonClick:(id)sender {
  // 如果NSTimer物件尚未建立或者已經暫停
  // 按下就開始播放
  if (!m_timer) {
    // 使用NSMethodSignature建立一個執行doFiveTimersPerSecond:
    // 的NSMethodSignature物件
    NSMethodSignature* signature = 
    [self methodSignatureForSelector:@selector(doFiveTimesPerSecond:)];
    // 新增NSInvocation物件
    NSInvocation* invocation = [NSInvocation 
                                invocationWithMethodSignature:signature];
    [invocation setTarget:self];
    [invocation setSelector:@selector(doFiveTimesPerSecond:)];
    // 將NSInvocation物件加入Timer
    m_timer = [NSTimer timerWithTimeInterval:0.2f 
                                  invocation:invocation repeats:YES];
    // 取得目前執行緒的Run Loop
    NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:m_timer forMode:NSDefaultRunLoopMode];
    
  }
}

- (IBAction)stopButtonClick:(id)sender {
  // 如果NSTimer是在運作狀態
  // 就讓計時器失效
  if (m_timer) {
    // 停止計時器
   [m_timer invalidate];
    // 設定變數指標為nil
    m_timer = nil;
  }
}
- (void)dealloc {
    [m_progressBar release];
    [super dealloc];
}
@end
