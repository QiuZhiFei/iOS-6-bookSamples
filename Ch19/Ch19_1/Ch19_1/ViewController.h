//
//  ViewController.h
//  Ch19_1
//
//  Created by Ho Mark on 12/7/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class AVAudioPlayer;

@interface ViewController : UIViewController <AVAudioPlayerDelegate>{
  // 對應到停止按鈕
  IBOutlet UIButton *m_stopButton;
  // 對應到播放按鈕
  IBOutlet UIButton *m_playButton;
  // 播放器的實例
  AVAudioPlayer* m_audioPlayer;
  // 播放音效的實例
  AVAudioPlayer* m_audioPlayer2;  

  // 歌曲檔名
  IBOutlet UILabel *m_fileLabel;
  // NSTimer的實例
  NSTimer* m_timer;
  // 進度滑桿控制列
  IBOutlet UISlider *m_progress;
  // 左聲道平均值
  IBOutlet UILabel *m_leftAverage;
  // 左聲道最大值
  IBOutlet UILabel *m_leftMaximum;
  // 右聲道平均值
  IBOutlet UILabel *m_rightAverage;
  // 右聲道最大值
  IBOutlet UILabel *m_rightMaximum;
  // 播放資訊
  IBOutlet UILabel *m_playInfo;
  // 對應到音效鼓
  IBOutlet UIButton *m_drumButton;
}
// 按下播放的回應
- (IBAction)playPress:(id)sender;
// 按下停止的回應
- (IBAction)stopPress:(id)sender;
//音量調整的回應
- (IBAction)volumnChange:(id)sender;
// 立體聲改變的回應
- (IBAction)stereoChange:(id)sender;
// 停止更新的計時器
- (void) stopTimer;
// 啟動更新的計時器
- (void) startTimer;
// 更新目前的狀態
-(void) updateProgress;
// 當狀態滑桿移動時設定播放的時間點
- (IBAction)progressChange:(id)sender;

- (IBAction)playDrum:(id)sender;

@end
