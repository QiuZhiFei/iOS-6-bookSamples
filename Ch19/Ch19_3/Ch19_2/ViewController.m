//
//  ViewController.m
//  Ch19_2
//
//  Created by Ho Mark on 12/7/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // 取得檔案的URL
    
    NSURL* url = 
    [[NSBundle mainBundle] URLForResource:@"part1" withExtension:@"m4v"];
    /*
     NSURL* url = 
     [NSURL URLWithString:@"http://10.96.29.160/~mark/trial/prog_index.m3u8"];
     */
    // 初始化播放項目
    AVPlayerItem* item1 = [AVPlayerItem playerItemWithURL:url];
    // 初始化撥放器
    m_player = [AVPlayer playerWithPlayerItem:item1];
    // 將按鈕設定為非選取
    m_playButton.selected = NO;
    // 初始化m_appDelegate的變數
    m_appDelegate = 
    (AppDelegate*)[[UIApplication sharedApplication] delegate];
  }
  return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
  // 取得 AVPlayer的影片播放圖層
  m_playerLayer = 
  [AVPlayerLayer playerLayerWithPlayer:m_player];
  // 設定影片的可見度是0.1
  m_playerLayer.opacity = 0.1;
  // 設置影片的大小
  m_playerLayer.bounds = CGRectMake(0, 0, 320, 200);
  // 設置影片的位置
  m_playerLayer.position = CGPointMake(160.0, 100.0);
  // 將這個影片畫面加至UiView下的layer中
  [self.view.layer addSublayer:m_playerLayer];
  

}

- (void)viewDidUnload
{
  [m_playButton release];
  m_playButton = nil;
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

- (void)dealloc {
  [m_playButton release];
  [super dealloc];
}
- (IBAction)playClick:(id)sender {
  if (!isExtScreenSet && m_appDelegate.externalWindow) {
    // 將原本的AVPlayer移除 
    [m_playerLayer removeFromSuperlayer];
    //重新取得這層
    m_playerLayer = 
    [AVPlayerLayer playerLayerWithPlayer:m_player];
    // 設定影片的可見度是0.1
    m_playerLayer.opacity = 0.1;
    // 設置影片的大小
    m_playerLayer.bounds = m_appDelegate.externalWindow.bounds;
    // 設置影片的位置
    m_playerLayer.position = m_appDelegate.externalWindow.center;
    // 將這個影片畫面加至UiView下的layer中
    [m_appDelegate.externalWindow.layer addSublayer:m_playerLayer];
    isExtScreenSet = YES;
  }
  // 在撥放的狀態
  if (m_playButton.isSelected) {
    // 設定按鈕是在影片停止時的狀態，也就是Play
    m_playButton.selected = NO;
    // 因此按下時是停止
    [m_player pause];
    // 停止後將畫面淡出
    [CATransaction begin];
    [CATransaction setAnimationDuration:5.0];
    m_playerLayer.opacity = 0.1;
    [CATransaction commit];
  } else { // 在停止的狀態
    // 設定按鈕是在影片撥放時的狀態，也就是PAUSE
    m_playButton.selected = YES;
    // 並且撥放
    [m_player play];
    initialTime = [m_player currentTime];
    // 開始後將畫面淡入
    [CATransaction begin];
    [CATransaction setAnimationDuration:5.0];
    m_playerLayer.opacity = 1;
    [CATransaction commit];
  }
}

- (IBAction)stopClick:(id)sender {
  // 停止撥放
  [m_player pause];
  // 回到開始的時間
  [m_player seekToTime:initialTime];
  // 重設按下按鈕的狀能
  m_playButton.selected = NO;
  // 停止後將畫面淡出
  [CATransaction begin];
  [CATransaction setAnimationDuration:5.0];
  m_playerLayer.opacity = 0.1;
  [CATransaction commit];
}

- (IBAction)externalWindowClick:(id)sender {
  isExtScreenSet = false;
  [m_appDelegate detechExternalScreen];
}
@end
