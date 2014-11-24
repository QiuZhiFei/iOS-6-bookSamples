//
//  ViewController.m
//  Ch14_6
//
//  Created by Ho Mark on 12/6/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
typedef void (^SumBlock) (int);
- (void)viewDidLoad
{
    [super viewDidLoad];
//  [self executeBlockStatic];
  [self executeDummyBlock];
	// Do any additional setup after loading the view, typically from a nib.
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
  __block int sum = 0;
  SumBlock sumBlock = ^(int value) {
    // SumBlock沒有傳回值，不需return
    sum += value;
    //   return sum;
  };
  // 執行sumBlock(100)並且將結果印出來
  sumBlock(100);
//  NSLog(@"sumBlock執行的結果是%d",sumBlock(100));
  // 印出此時的m_total，應該和之前sumBlock的內容相同
  NSLog(@"此時的靜態變數sum值為%d",sum);
  // 單獨執行一次sumBlock(100)
  sumBlock(100);
  // 此時顯示的結果應該是累加的結果
  NSLog(@"此時的靜態變數sum值為%d",sum);
}

-(void) executeDummyBlock {
  // 宣告一個block沒有任何的參數
  // 也不用傳回任何值
  void (^sayHello) (void) = ^{
    NSLog(@"Hello World");
  };
  // 呼叫這個block的內容
  sayHello();
}

@end
