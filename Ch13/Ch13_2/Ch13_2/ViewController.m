//
//  ViewController.m
//  Ch13_2
//
//  Created by Ho Mark on 12/6/7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadStringFromBundle];
}

- (void)viewDidUnload
{
    [m_textView release];
    m_textView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [m_textView release];
    [super dealloc];
}

-(void) loadStringFromBundle {
  // 取得NSBundle的實例
  NSBundle* bundle = [NSBundle mainBundle];
  if (bundle) { // 如果可以取得
    NSString* fileURLString = 
    [bundle pathForResource:@"content" ofType:@"txt"];
    if (fileURLString) {
      NSString* contentString = 
      [NSString stringWithContentsOfFile:fileURLString 
                                encoding:NSUTF8StringEncoding 
                                   error:nil];
      //將內容設定進文字元件
      m_textView.text = contentString;
    }
  }
}
@end
