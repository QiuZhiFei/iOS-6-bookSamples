//
//  ViewController.m
//  Ch13_12
//
//  Created by Ho Mark on 12/6/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  [self generateSecondThread];
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
-(void) generateSecondThread {
  // 使用doInSecondThread的函數創建一個作業元件
  NSInvocationOperation* secondOperation = 
  [[[NSInvocationOperation alloc] initWithTarget:self 
                                        selector:@selector(doInSecondThread) 
                                          object:self] autorelease];
  // 新增一個自訂的佇列
  NSOperationQueue* queue = [[[NSOperationQueue alloc] init]autorelease];
  // 自訂佇列允許多個作業元件並時執行
  NSLog(@"自訂佇列最大可以同步執行的作業元件數為 %d",[queue maxConcurrentOperationCount]);  
  [queue addOperation:secondOperation];
  
  for (int i = 0; i < 10; i++) {
    NSLog(@"主執行緒:%d",i);
  }
  
}

-(void) doInSecondThread {
  for (int i = 0; i < 10; i++) {
    NSLog(@"新增作業元件:%d",i);
  }
}

@end
