//
//  ViewController.h
//  Ch19_2
//
//  Created by Ho Mark on 12/7/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class AppDelegate;
@interface ViewController : UIViewController {
  // AVFoundation下的影片播放器
  AVPlayer*  m_player;
  // 播放器的圖層
  AVPlayerLayer* m_playerLayer;
  // 預覽的畫面
  IBOutlet UIImageView *m_imageView;
  // Play按鈕元件
  IBOutlet UIButton *m_playButton;
  // 記錄播放的初始時間
  CMTime initialTime;
  // 連結到主程式的參照
  AppDelegate* m_appDelegate;
  // 是否設定了外部營幕
  bool isExtScreenSet;
}
// 按下Play按鈕時的回應
- (IBAction)playClick:(id)sender;
// 按下Stop按鈕時的回應
- (IBAction)stopClick:(id)sender;
// 檢視外部的營幕
- (IBAction)externalWindowClick:(id)sender;

@end
