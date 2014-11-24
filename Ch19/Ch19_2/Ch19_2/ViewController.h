//
//  ViewController.h
//  Ch19_2
//
//  Created by Ho Mark on 12/7/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UIViewController {
  // 影片播放器
  MPMoviePlayerController* m_playerController;
  // 預覽的畫面
  IBOutlet UIImageView *m_imageView;
  // Play按鈕元件
  IBOutlet UIButton *m_playButton;
}
// 按下Play按鈕時的回應
- (IBAction)playClick:(id)sender;
// 按下Stop按鈕時的回應
- (IBAction)stopClick:(id)sender;

@end
