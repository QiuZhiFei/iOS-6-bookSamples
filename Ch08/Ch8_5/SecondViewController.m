//
//  SecondViewController.m
//  Ch8_5
//
//  Created by Ho Mark on 12/6/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize parameterString;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  // 設定標籤元件的文字屬性為外部傳入的值
	m_label.text = parameterString;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)doButtonClick:(id)sender {
  // 取得第一個畫面的ViewController
  // 並且呼叫取消第二個畫面的指令
  NSLog(@"click");
  [[self presentingViewController]
   dismissModalViewControllerAnimated:YES];
  
}
- (void)dealloc {
    [m_label release];
    [super dealloc];
}
@end
