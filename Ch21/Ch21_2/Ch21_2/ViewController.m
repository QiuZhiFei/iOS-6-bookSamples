//
//  ViewController.m
//  Ch21_2
//
//  Created by Ho Mark on 12/7/28.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void) beginDownload {
  // 取得圖檔的URL
  NSURL* url =
  [NSURL URLWithString:@"http://www.delightpress.com.tw/images/books/cover/SKNP00026.jpg"];
  // 從url產生Http request物件
  NSURLRequest* request = [NSURLRequest requestWithURL:url];
  // 準備建立連線
  NSURLConnection* connection =
  [[NSURLConnection alloc]
   initWithRequest:request delegate:self startImmediately:YES];
  // 檢視連線是否順利生成
  if (connection) {
    // 生成則初始化m_data準備接收
    m_data = [[NSMutableData data]retain];
  } else {
    // 沒有辦法生成則產生警告訊息
    UIAlertView* alertView =
    [[UIAlertView alloc] initWithTitle:@"連線失敗"
                               message:@"無法建立連線"
                              delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
  }
  
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // 開始下載
  [self beginDownload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - connection

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  m_status.text = @"下載中";
  [m_data appendData:data];
  
}
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  m_status.text = @"接收到回應";
   [m_data setLength:0];
}
-(void) connectionDidFinishLoading:(NSURLConnection *)connection {
  m_status.text = @"下載完成";
  // 產生UIImage元件
  UIImage* image = [UIImage imageWithData:m_data];
  m_imageView.image = image;
  // 呼叫release還原reference counting
  [m_data release];
  [connection release];
}
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
  // 釋放變數
  [connection release];
  
  [m_data release];
  // 產生警告訊息
  UIAlertView* alertView =
  [[UIAlertView alloc] initWithTitle:@"連線失敗"
                             message:@"無法順利完成連線"
                            delegate:nil
                   cancelButtonTitle:@"OK"
                   otherButtonTitles:nil, nil];
  [alertView show];
  [alertView release];
}
- (void)dealloc {
  [m_imageView release];
  [m_status release];
  [super dealloc];
}
@end
