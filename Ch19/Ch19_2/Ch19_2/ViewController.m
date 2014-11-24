//
//  ViewController.m
//  Ch19_2
//
//  Created by Ho Mark on 12/7/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // 取得檔案的URL
/*
    NSURL* url = 
    [[NSBundle mainBundle] URLForResource:@"part1" withExtension:@"m4v"];
 */
    NSURL* url = 
    [NSURL URLWithString:@"http://10.96.29.160/~mark/trial/prog_index.m3u8"];
    // 初始化撥放器
    m_playerController = 
    [[MPMoviePlayerController alloc]initWithContentURL:url];
    // 將按鈕設定為非選取
    m_playButton.selected = NO;
    // 設置撥放器的畫面
    [m_playerController.view setFrame:CGRectMake(0, 0, 320, 200)];
  }
  return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
  // 擷圖作為預設的背景圖
  m_imageView.image = 
  [m_playerController 
   thumbnailImageAtTime:0 
   timeOption:MPMovieTimeOptionNearestKeyFrame];
  // 擷圖後可能會自動撥放
  [m_playerController stop];
  // 預備撥放
  [m_playerController prepareToPlay];
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
  // 在撥放的狀態
  if (m_playButton.isSelected) {
    // 設定按鈕是在影片停止時的狀態，也就是Play
    m_playButton.selected = NO;
    // 因此按下時是停止
    [m_playerController pause];
    
  } else { // 在停止的狀態
    // 設定按鈕是在影片撥放時的狀態，也就是PAUSE
    m_playButton.selected = YES;
    // 按下去時將畫面加入
    [self.view addSubview:m_playerController.view];
    // 並且撥放
    [m_playerController play];
  }
}

- (IBAction)stopClick:(id)sender {
  // 停止撥放
  [m_playerController stop];
  // 重設按下按鈕的狀能
  m_playButton.selected = NO;
  // 將撥放器的畫面移除
  [m_playerController.view removeFromSuperview];
}
@end
