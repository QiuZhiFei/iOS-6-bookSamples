//
//  ViewController.m
//  Ch14_5
//
//  Created by Ho Mark on 12/6/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef int (^SumBlock) (int);
// 宣告一個靜態變數
static int g_sum = 0;
SumBlock sumBlock = ^(int value) {
  g_sum += value;
  return g_sum;
};
@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSLog(@"第一次執行");
	[self executeBlockStatic];
  NSLog(@"第二次執行");
  [self executeBlockStatic];
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
-(void) executeBlockStatic {
  // 執行sumBlock(100)並且將結果印出來
  NSLog(@"sumBlock執行的結果是%d",sumBlock(100));
  // 印出此時的m_total，應該和之前sumBlock的內容相同
  NSLog(@"此時的靜態變數g_sum值為%d",g_sum);
  // 單獨執行一次sumBlock(100)
  sumBlock(100);
  // 此時顯示的結果應該是累加的結果
  NSLog(@"此時的靜態變數g_sum值為%d",g_sum);
}
@end
