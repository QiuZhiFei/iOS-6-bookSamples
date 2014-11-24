//
//  ViewController.h
//  Ch21_2
//
//  Created by Ho Mark on 12/7/28.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 
{
  // 連結至畫面上的影像視覺元件
  IBOutlet UIImageView *m_imageView;
  // 連結至畫面上的標籤元件
  IBOutlet UILabel *m_status;
}
// 開始下載的程序
-(void) beginDownload;

@end
