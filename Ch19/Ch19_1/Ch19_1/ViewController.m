//
//  ViewController.m
//  Ch19_1
//
//  Created by Ho Mark on 12/7/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // 讀取Bundle中的sample.mp3
    NSURL* fileUrl = 
    [[NSBundle mainBundle]URLForResource:@"sample" 
                           withExtension:@"mp3"];
    // 初始化音樂播放器
    m_audioPlayer = 
    [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl 
                                          error:nil];
    // 指定播放器的代理物件
    m_audioPlayer.delegate = self;
    // 啟動音樂量化
    m_audioPlayer.meteringEnabled = YES;
    // 準備播放
    [m_audioPlayer prepareToPlay];
    // 取得音效檔音效
    NSURL* fileUrl2 = 
    [[NSBundle mainBundle]URLForResource:@"Drum" 
                           withExtension:@"wav"];
    // 建立播放器
    m_audioPlayer2 = 
    [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl2 
                                          error:nil];
    // 指定播放器的代理物件
    m_audioPlayer2.delegate = self;
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // 取出檔名並且顯示於畫面上
  m_fileLabel.text = 
  [m_audioPlayer.url lastPathComponent];
  // 設置這個應用程式可以背景執行
  AVAudioSession *session = 
  [AVAudioSession sharedInstance]; 
  // 設定這個音樂播放的類別
  [session setCategory:AVAudioSessionCategoryPlayback 
                 error:nil];  
  // 啟動這個session
  [session setActive:YES error:nil];
}

- (void)viewDidUnload
{
  [m_playButton release];
  m_playButton = nil;
  [m_stopButton release];
  m_stopButton = nil;
  [m_fileLabel release];
  m_fileLabel = nil;
  [m_progress release];
  m_progress = nil;
  [m_progress release];
  m_progress = nil;
  [m_leftAverage release];
  m_leftAverage = nil;
  [m_leftMaximum release];
  m_leftMaximum = nil;
  [m_rightAverage release];
  m_rightAverage = nil;
  [m_rightMaximum release];
  m_rightMaximum = nil;
  [m_playInfo release];
  m_playInfo = nil;
  [m_drumButton release];
  m_drumButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)playPress:(id)sender {
  // 取得按鈕的實例
  UIButton* button = (UIButton*) sender;  
  if (!button.isSelected) {
    // 如果在暫停狀態
    [button setSelected:YES];
    // 就進行播放
    [m_audioPlayer play];
    // 更新畫面
    [self startTimer];
  } else {
    // 如果在播放狀態
    [button setSelected:NO];
    // 就進行暫停
    [m_audioPlayer pause];
    // 停止更新
    [self stopTimer];
  }
}

- (IBAction)stopPress:(id)sender {
  // 按下暫停
  m_playButton.selected = NO;
  // 停止播放
  [m_audioPlayer stop];
  // 設定從頭播放
  m_audioPlayer.currentTime = 0.0f;
  // stop之後要prepareToPlay
  [m_audioPlayer prepareToPlay];
  // 停止更新
  [self stopTimer];
}

- (IBAction)volumnChange:(id)sender {
  UISlider* slider = (UISlider*) sender;
  m_audioPlayer.volume = slider.value;
}

- (IBAction)stereoChange:(id)sender {
  UISlider* slider = (UISlider*) sender;
  // 左右聲道是從-1到1
  // 將滑桿值從0到1轉換到-1到1
  float pan = slider.value*2-2;
  m_audioPlayer.pan = pan;
}

- (void)dealloc {
  [m_playButton release];
  [m_stopButton release];
  [m_fileLabel release];
  [m_progress release];
  [m_progress release];
  [m_leftAverage release];
  [m_leftMaximum release];
  [m_rightAverage release];
  [m_rightMaximum release];
  [m_playInfo release];
  [m_drumButton release];
  [super dealloc];
}

- (void) stopTimer {
  if (m_timer) {
    [m_timer invalidate];
    m_timer = nil;
  }
  
}
- (void) startTimer {
  if (!m_timer) {
    // 每0.1秒啟動updateProgress函數更新狀態
    m_timer = 
    [NSTimer 
     scheduledTimerWithTimeInterval:0.1 
     target:self 
     selector:@selector(updateProgress) 
     userInfo:nil 
     repeats:YES];
  }
  
}

-(void) updateProgress {
  // 計算目前的比例
  float ratio = m_audioPlayer.currentTime/m_audioPlayer.duration;
  // 更新播放進度滑桿
  m_progress.value = ratio;
  [m_audioPlayer updateMeters];
  // 更新左側聲道平均值
  m_leftAverage.text = 
  [NSString stringWithFormat:@"%.4f",
   [m_audioPlayer averagePowerForChannel:0]];
  // 更新右側聲道平均值
  m_rightAverage.text = 
  [NSString stringWithFormat:@"%.4f",
   [m_audioPlayer averagePowerForChannel:1]];
  // 更新左側聲道最大值
  m_leftMaximum.text = 
  [NSString stringWithFormat:@"%.4f",
   [m_audioPlayer peakPowerForChannel:0]];
  // 更新右側聲道最大值
  m_rightMaximum.text = 
  [NSString stringWithFormat:@"%.4f",
   [m_audioPlayer peakPowerForChannel:1]];
  // 更新目前播放的時間顯示
  m_playInfo.text = 
  [NSString stringWithFormat:@"%.1f/%.1f",
   m_audioPlayer.currentTime,m_audioPlayer.duration];
}

- (IBAction)progressChange:(id)sender {
  // 依照滑桿的比例算出要播放的時間 
  float currentTIme = 
  ((UISlider*) sender).value*m_audioPlayer.duration;
  // 進行播放
  m_audioPlayer.currentTime = currentTIme;
}

- (IBAction)playDrum:(id)sender { 
  // 準備播放
  [m_audioPlayer2 play];
  // 播放後將按鈕設為不能按下的狀態
  UIButton* button = (UIButton*)sender;
  button.enabled = NO;
}

- (void)audioPlayerDidFinishPlaying: 
  (AVAudioPlayer *)player successfully: (BOOL)flag {
  // 正常播放完成的回應
  if(player == m_audioPlayer2) {
    // 如果是音效鼓結束，將音效鼓的按鈕還原
    m_drumButton.enabled = YES;
  } else if (player == m_audioPlayer) {
    // 正常播放完成，讓按鈕回復到PLAY的狀態
    m_playButton.selected = NO;
  }
  
}
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
  // 預設會暫停
}
- (void) audioPlayerEndInterruption:(AVAudioPlayer *)player 
                          withFlags:(NSUInteger)flags {
  // 如果不在播放狀態不需要特別處理
  if (!m_playButton.isSelected) {
    return;
  }
  // 如果在中斷狀態需要處理時
  if (flags == 
      AVAudioSessionInterruptionFlags_ShouldResume) {
    //已經準備好可以直接繼續
    [m_audioPlayer play];
  } else {
    // 如果不是的話就
    // 重新初始化準備播放後播放
    [m_audioPlayer prepareToPlay];
    [m_audioPlayer play];
  }
}
@end
