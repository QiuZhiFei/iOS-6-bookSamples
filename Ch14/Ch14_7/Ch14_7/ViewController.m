//
//  ViewController.m
//  Ch14_7
//
//  Created by Ho Mark on 12/6/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
static int g_sum = 0;
@implementation ViewController
-(void) createBlockAndDebug {
  // 宣告一個本地端自動變數
  int sum = 0;
  void (^printVarBlock) (void) = ^{
    NSLog(@"m_sum的值是%d,g_sum的值是%d,sum的值是 %d",m_sum,g_sum,sum);
  };
  printVarBlock();
  sum = 100;
  NSLog(@"在這裡作第一次偵錯");
  g_sum = 100;
  NSLog(@"在這裡作第二次偵錯");
  m_sum = 100;
  NSLog(@"在這裡作第三次偵錯");
  
}

-(void) createBlockWithParamAndDebug {
  // 傳入整數作為參數
  void (^loopBlock) (int) = ^(int x){
    NSLog(@"傳入的參數是%d",x);
  };
  // 執行一次避免編譯警告
  loopBlock(0);
  NSLog(@"中斷執行loopBlock並傳入參數");
  // 傳入兩個整數作乘法
  int (^mulBlock) (int,int) = 
  ^(int x, int y) {
    int result = x*y;
    NSLog(@"傳入的兩個整數分別是%d,%d, 結果是%d",x,y,result);
    return result;
  };
  // 執行一次避免編譯警告
  mulBlock(3,4);
  NSLog(@"中斷執行loopBlockWithPrefix並傳入參數");
  
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	[self createBlockWithParamAndDebug];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
