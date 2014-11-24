//
//  ViewController.h
//  Ch13_7
//
//  Created by Ho Mark on 12/6/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 連結至畫面中央的進度顯示
  IBOutlet UIProgressView *m_progressBar;
  // 計時器元件
  NSTimer* m_timer;
}
- (IBAction)startButtonClick:(id)sender;
- (IBAction)stopButtonClick:(id)sender;
// 一秒會被計時器啟動五次
- (void) doFiveTimesPerSecond:(NSTimer*)timer;
@end
