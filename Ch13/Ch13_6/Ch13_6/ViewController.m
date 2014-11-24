//
//  ViewController.m
//  Ch13_6
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
  // 從timer的userInfo中取值
  NSString* outputString = (NSString*)timer.userInfo;
  m_label.text = outputString;
}
-(void)fireATimer {
  for (int i =0; i < 5; i++) {
    NSString* outputString = [NSString stringWithFormat:@"第%d次執行",i];
    // 每五秒啟動doAfterFiveSecond
    // 將字串放至userInfo之中
    [NSTimer scheduledTimerWithTimeInterval:(i+1)*5 
            target:self 
            selector:@selector(doAfterFiveSecond:) 
            userInfo:outputString 
            repeats:NO];
  }
}
- (void)dealloc {
  [m_label release];
  [m_label release];
  [super dealloc];
}

@end
