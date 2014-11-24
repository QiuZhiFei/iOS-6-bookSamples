//
//  ViewController.m
//  Ch21_1
//
//  Created by Ho Mark on 12/7/28.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void) setupWebView {
  // 新增一筆悅知文化的NSURL物件
  NSURL* loadingUrl =
  [NSURL URLWithString:@"http://www.delightpress.com.tw"];
  // 新增一個NSURLRequest
  NSURLRequest* request =
  [NSURLRequest requestWithURL:loadingUrl];
  // 載入畫面
  [m_webView loadRequest:request];
}
- (void)viewDidLoad
{
  [super viewDidLoad];
  // 設定ViewController為它的代理物件
  m_webView.delegate = self;
  // 設定網頁載入的目標
	[self setupWebView];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  [m_webView release];
  [m_statusLabel release];
  [super dealloc];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
  m_statusLabel.alpha = 1;
  m_statusLabel.text=@"正在載入中...";
  
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
  
  m_statusLabel.text=@"載入完成...";
  // 產生動畫淡出消失
  [UIView animateWithDuration:5.0 animations:^{
    m_statusLabel.alpha = 0;
  }];
  
  
}
-(void)webView:(UIWebView *)webView
didFailLoadWithError:(NSError *)error {
  m_statusLabel.alpha = 1;
  m_statusLabel.text=@"載入發生錯誤:";
}
@end
