//
//  ViewController.m
//  Ch13_5
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
	[self fireATimer];
}

- (void)viewDidUnload
{
  [m_label release];
  m_label = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) doAfterFiveSecond:(NSTimer*) timer {
  NSLog(@"五秒後驅動的函數");
  m_label.text = @"五秒過後執行了";
}
-(void)fireATimer {
  NSLog(@"準備執行計時器");
  // 五秒後啟動doAfterFiveSecond
  [NSTimer scheduledTimerWithTimeInterval:5.0 
           target:self 
           selector:@selector(doAfterFiveSecond:) 
           userInfo:nil 
           repeats:NO];
  NSLog(@"NSTimer回傳，執行其它的指令");
}
- (void)dealloc {
  [m_label release];
  [super dealloc];
}
@end
