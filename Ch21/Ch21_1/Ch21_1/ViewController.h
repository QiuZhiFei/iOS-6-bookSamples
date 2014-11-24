//
//  ViewController.h
//  Ch21_1
//
//  Created by Ho Mark on 12/7/28.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate> {
  // 連結至全畫面的網頁顯示元件
  IBOutlet UIWebView *m_webView;
  // 連結至畫面上的Status標籤
  IBOutlet UILabel *m_statusLabel;
  
}
// 設定並初始化網頁顯示元件
-(void) setupWebView;
@end
