//
//  ViewController.m
//  Ch5_1
//
//  Created by Ho Mark on 12/3/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  // viewDidLoad是在View被載入初始化時被呼叫
  [super viewDidLoad];
	m_firstLabel.text = @"這是第一個IBOutlet物件";
  m_secondLabel.text= @"這是下方的IBOutlet物件，是由介面編輯器生成";
}

- (void)viewDidUnload
{
  // viewDidUnload是在View被移除時被呼叫
  [m_secondLabel release];
  m_secondLabel = nil;
  [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

- (void)dealloc {
  [m_secondLabel release];
  [super dealloc];
}

-(IBAction) changeFirstLabelText {
  // 修改UILabel的內容
  m_firstLabel.text=@"點擊了修改的按鈕";
}

// 對應到修改2的按鈕
-(IBAction) changeFirstLabelTextAgain 
{
  // 修改UILabel的內容
  m_firstLabel.text=@"點擊了修改2的按鈕";
}

- (IBAction)generateActionForButton3:(id)sender {
  // 修改UILabel的內容
  m_firstLabel.text=@"點擊了按鈕並且執行自動生成的函數";
}

@end
