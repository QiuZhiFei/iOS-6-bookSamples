//
//  ViewController.m
//  Ch13_9
//
//  Created by Ho Mark on 12/6/10.
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
 
  [NSThread 
   detachNewThreadSelector:@selector(doInSecondThread) 
   toTarget:self 
   withObject:nil];
 
  /*
  // 新增一個執行緒
  NSThread* thread = [[NSThread alloc]
    initWithTarget:self selector:@selector(doInSecondThread) object:nil];
  // 啟動這個執行緒
  [thread start];
  [thread release];
   */
  //執行主執行緒的內容
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
