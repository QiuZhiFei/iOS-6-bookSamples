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
  [NSURL URLWithString:
   @"http://www.delightpress.com.tw/images/books/cover/SKNP00026.jpg"];
  // 從url產生Http request物件
  NSURLRequest* request = [NSURLRequest requestWithURL:url];
  // 產生一個GCD的佇列
  dispatch_queue_t downloadQueue =
  dispatch_queue_create("con.delightpress.downloadQueue",
                        DISPATCH_QUEUE_CONCURRENT);
  NSLog(@"用另一個執行緒非同步下載");
  dispatch_async(downloadQueue, ^{
    NSLog(@"準備開始下載");
    // 下載中
    NSData* data =
    [NSURLConnection
     sendSynchronousRequest:request
     returningResponse:nil
     error:nil];
    if (data) {
      NSLog(@"下載完成");
      // 產生UIImage元件
      UIImage* image = [UIImage imageWithData:data];
      dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"在主執行緒中設定影像");
        // 修改UI要使用主執行緒
        m_imageView.image = image;
        m_status.text = @"下載完成";
      });
    }else {
      NSLog(@"下載失敗");
      // 沒有辦法生成則產生警告訊息
      dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView* alertView =
        [[UIAlertView alloc]
         initWithTitle:@"連線失敗"
         message:@"無法建立連線"
         delegate:nil
         cancelButtonTitle:@"OK"
         otherButtonTitles:nil, nil];
        [alertView show];
        [alertView release];
        
      });
    }
  });
  NSLog(@"可以繼續作其它事");
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

- (void)dealloc {
  [m_imageView release];
  [m_status release];
  [super dealloc];
}
@end
