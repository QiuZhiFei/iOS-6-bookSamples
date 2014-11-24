//
//  ViewController.m
//  Ch16_3
//
//  Created by Ho Mark on 12/6/25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [m_imageView release];
    m_imageView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [m_imageView release];
    [super dealloc];
}
- (IBAction)doFadeOut:(id)sender {
  // 開始一個動畫交易
  [UIView beginAnimations:nil context:nil];
  // 設定時間
  [UIView setAnimationDuration:3];
  // 設定動畫完成的透明度是完全透明
  m_imageView.alpha = 0.0;
  // 提交動畫開始執行
  [UIView commitAnimations];
}

- (IBAction)doFadeIn:(id)sender {
  // 使用block的函數在三秒進行淡入的動畫
  [UIView animateWithDuration:3 animations:^{
    // 設定畫面是完全不透明 
    m_imageView.alpha = 1.0;
  }];
}

- (IBAction)doFadeOutAndDown:(id)sender {
  // 使用block的函數在三秒進行淡入的動畫
  [UIView animateWithDuration:3 animations:^{
    // 設定畫面變淡
    m_imageView.alpha = 0.3;
    // 將物件的畫面往下移動
    m_imageView.frame = CGRectMake(10.0, 200.0, 165.0, 218.0);
  }];}

- (IBAction)doFadeInThenUp:(id)sender {
  // 使用block的函數在三秒進行淡入的動畫
  [UIView animateWithDuration:3 animations:^{
    // 設定畫面為不透明
    m_imageView.alpha = 1.0;
    
  } completion:^(BOOL finished) {
    // 回到原點
    [self upToOrigin];
  }
   ];
}

- (IBAction)doTwinkle:(id)sender {
  [UIView 
   animateWithDuration:1 
   delay:0 
   options:UIViewAnimationOptionAutoreverse | 
   UIViewAnimationOptionRepeat
   animations:^{
     m_imageView.alpha = 0;
   } completion:^(BOOL finished) {
     ;
   }];
}

- (IBAction)doUp:(id)sender {
  //會從目前的狀態開始上移
  [UIView 
   animateWithDuration:5    
   delay:0 
   options:UIViewAnimationOptionBeginFromCurrentState
   animations:^{
     m_imageView.frame = 
     CGRectMake(10.0, 10.0, 165.0, 218.0);
   } 
   completion:^(BOOL finished) {
     ;
   }
   ];
  
}

- (IBAction)doDown:(id)sender {
  // 會直接下移
  // 會將前一段動畫強制結束
  [UIView 
   animateWithDuration:5 
   animations:^{
     m_imageView.frame = 
     CGRectMake(10.0, 200.0, 165.0, 218.0);
   }];

}

- (IBAction)doCAUp:(id)sender {
  [UIView 
   animateWithDuration:5 
   animations:^{
     // 取得這個物件的動畫圖層 
     CALayer* caLayer = m_imageView.layer;
     caLayer.position = CGPointMake(90.0, 120.0);
   }];
}

- (IBAction)doCADown:(id)sender {
  [UIView 
   animateWithDuration:5 
   animations:^{
      // 取得這個物件的動畫圖層
     CALayer* caLayer = m_imageView.layer;
     caLayer.position = CGPointMake(90.0, 320.0);  
   }];
}



-(void) upToOrigin {
  [UIView animateWithDuration:3 animations:^{
    m_imageView.frame = 
    CGRectMake(10.0,10.0, 165.0, 218.0);
  }];
  
}
@end
