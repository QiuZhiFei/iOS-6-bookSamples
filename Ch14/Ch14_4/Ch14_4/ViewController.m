//
//  ViewController.m
//  Ch14_4
//
//  Created by Ho Mark on 12/6/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
typedef int (^SumBlock) (int);
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self executeBlockLocal];
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


-(void) executeBlock {
  // 設定成員變數初始值為0
  m_total = 0;
  // 宣告一個SumBlock型態的block變數sumBlock，並且定義內容
  SumBlock sumBlock = ^(int value) {
    m_total += value;
    return m_total;
  };
  // 執行sumBlock(100)並且將結果印出來
  NSLog(@"sumBlock執行的結果是%d",sumBlock(100));
  // 印出此時的m_total，應該和之前sumBlock的內容相同
  NSLog(@"此時的m_total值為%d",m_total);
  // 單獨執行一次sumBlock(100)
  sumBlock(100);
  // 此時顯示的結果應該是累加的結果
  NSLog(@"此時的m_total值為%d",m_total);
}


-(void) executeBlockLocal {
  // 設定區域自動變數初始值為0
  __block int total = 0;
  // 宣告一個SumBlock型態的block變數sumBlock，並且定義內容
  SumBlock sumBlock = ^(int value) {
    total += value;
    return total;
  };
  // 執行sumBlock(100)並且將結果印出來
  NSLog(@"sumBlock執行的結果是%d",sumBlock(100));
  // 印出此時的m_total，應該和之前sumBlock的內容相同
  NSLog(@"此時的total值為%d",total);
  // 單獨執行一次sumBlock(100)
  sumBlock(100);
  // 此時顯示的結果應該是累加的結果
  NSLog(@"此時的total值為%d",total);
  
}
@end
