//
//  ViewController.m
//  Ch13_11
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
-(void) generateSecondThread {
  // 使用doInSecondThread的函數創建一個作業元件
  NSInvocationOperation* secondOperation = 
  [[[NSInvocationOperation alloc] initWithTarget:self 
    selector:@selector(doInSecondThread) 
    object:self] autorelease];
  // 取得主執行緒的作業佇列
  NSOperationQueue* mainQueue = [NSOperationQueue mainQueue];
  //    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
  // NSLog(@"the queue is %d",[queue maxConcurrentOperationCount]);
  NSLog(@"主執行緒最大可以同步執行的作業元件數為 %d",[mainQueue maxConcurrentOperationCount]);
  
  [mainQueue addOperation:secondOperation];
 
   for (int i = 0; i < 10; i++) {
   NSLog(@"主執行緒中的迴圈是%d",i);
   }
   
}

-(void) doInSecondThread {
  for (int i = 0; i < 10; i++) {
    NSLog(@"第二個執行緒中的迴圈是%d",i);
  }
}


@end
