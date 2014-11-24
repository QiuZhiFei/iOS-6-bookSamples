//
//  ViewController.m
//  Ch16_7
//
//  Created by Ho Mark on 12/7/3.
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
  // 初始化CALayer
  [self initCALayer];
  // 初始化畫面的視景
  [self initPerspective];

}

-(void) initCALayer {
  // 創建動畫圖層1
  m_caLayer1 = [CALayer layer];
  // 設定該圖層是100*100的正方向
  m_caLayer1.bounds = CGRectMake(0.0, 0.0, 100.0, 100.0);
  // 設定圓角
  m_caLayer1.cornerRadius = 10;    
  // 設定中心位置
  m_caLayer1.position = CGPointMake(140.0f, 140.0f);
  // 設定背景色
  m_caLayer1.backgroundColor = [[UIColor blueColor] CGColor];
  // 設定Z軸在0
  m_caLayer1.zPosition = 0.0f;
  // 設定能見度在0.5 (透明度)
  m_caLayer1.opacity = 0.5;
  // 設定邊緣顏色與寬度
  m_caLayer1.borderColor = [[UIColor blackColor]CGColor];
  m_caLayer1.borderWidth = 2;
  // 加至圖層中
  [m_subLayer.layer addSublayer:m_caLayer1];

  // 創建動畫圖層2
  m_caLayer2 = [CALayer layer];
  // 設定該圖層是100*100的正方向
  m_caLayer2.bounds = CGRectMake(0.0, 0.0, 100.0, 100.0);
  // 設定圓角
  m_caLayer2.cornerRadius = 10;    
  // 設定中心位置
  m_caLayer2.position = CGPointMake(150.0f, 150.0f);
  // 設定背景色
  m_caLayer2.backgroundColor = [[UIColor greenColor] CGColor];
  // 設定Z軸在-10
  m_caLayer2.zPosition = 50.0f;
  // 設定能見度在0.5 (透明度)
  m_caLayer2.opacity = 0.5;
  // 設定邊緣顏色與寬度
  m_caLayer2.borderColor = [[UIColor blackColor]CGColor];
  m_caLayer2.borderWidth = 2;
  // 加至圖層中
  [m_subLayer.layer addSublayer:m_caLayer2];
  
  // 創建動畫圖層3
  m_caLayer3 = [CALayer layer];
  // 設定該圖層是100*100的正方向
  m_caLayer3.bounds = CGRectMake(0.0, 0.0, 100.0, 100.0);
  // 設定圓角
  m_caLayer3.cornerRadius = 10;    
  // 設定中心位置
  m_caLayer3.position = CGPointMake(160.0f, 160.0f);
  // 設定背景色
  m_caLayer3.backgroundColor = [[UIColor redColor] CGColor];
  // 設定Z軸在20
  m_caLayer3.zPosition = 100.0f;
  // 設定能見度在0.5 (透明度)
  m_caLayer3.opacity = 0.5;
  // 設定邊緣顏色與寬度
  m_caLayer3.borderColor = [[UIColor blackColor]CGColor];
  m_caLayer3.borderWidth = 2;
  // 加至圖層中
  [m_subLayer.layer addSublayer:m_caLayer3];

  
}

-(void) initPerspective {
  // 建立視點
  CATransform3D perspective = CATransform3DIdentity;
  int distance = 150;
  perspective.m34 = -1/distance;
  // 將現在的變換矩陣存入
  currentTransform = perspective;
  // 改變圖層的視點
  m_subLayer.layer.sublayerTransform = currentTransform;
}

- (IBAction)doFirstOrder:(id)sender {
  // 排列順序是 caLayer1, caLayer2, caLayer3
  [CATransaction setAnimationDuration:5.0];
  m_caLayer1.zPosition = 100;
  m_caLayer2.zPosition = 50;
  m_caLayer3.zPosition = 0;
}

- (IBAction)doSecondOrder:(id)sender {
  // 排列順序是 caLayer2, caLayer3, caLayer1
  [CATransaction setAnimationDuration:5.0];
  m_caLayer2.zPosition = 100;
  m_caLayer3.zPosition = 50;
  m_caLayer1.zPosition = 0;
}

- (IBAction)doThirdOrder:(id)sender {
  // 排列順序是caLayer3, caLayer1, caLayer2
  [CATransaction setAnimationDuration:5.0];
  m_caLayer3.zPosition = 100;
  m_caLayer1.zPosition = 50;
  m_caLayer2.zPosition = 0;
}

- (IBAction)doRotateX:(id)sender {
  // 建立旋轉的動畫
  CABasicAnimation* rotateAnim =  
  // 修改位移屬性
  [CABasicAnimation
   animationWithKeyPath:@"sublayerTransform"];
  // 確認動畫效果會持續
  rotateAnim.fillMode = kCAFillModeForwards;
  rotateAnim.removedOnCompletion = NO;  
  // 總共花了3秒
  rotateAnim.duration = 3.0;
  CATransform3D rotateX3D = 
  CATransform3DRotate(currentTransform, M_PI/6, 1, 0, 0);
  NSValue* toValue = 
  [NSValue valueWithCATransform3D:rotateX3D];
  // 設定終止點是封裝的點
  rotateAnim.toValue = toValue;
  [m_subLayer.layer 
   addAnimation:rotateAnim 
   forKey:nil];
  // 將目前結果紀錄進currentTransform
  currentTransform = rotateX3D;
}

- (IBAction)doRotateY:(id)sender {
  // 建立旋轉的動畫
  CABasicAnimation* rotateAnim =  
  // 修改位移屬性
  [CABasicAnimation
   animationWithKeyPath:@"sublayerTransform"];
  // 確認動畫效果會持續
  rotateAnim.fillMode = kCAFillModeForwards;
  rotateAnim.removedOnCompletion = NO;  
  // 總共花了3秒
  rotateAnim.duration = 3.0;
  CATransform3D rotateY3D = 
  CATransform3DRotate(currentTransform, M_PI/6, 0, 1, 0);
  NSValue* toValue = 
  [NSValue valueWithCATransform3D:rotateY3D];
  // 設定終止點是封裝的點
  rotateAnim.toValue = toValue;
  [m_subLayer.layer 
   addAnimation:rotateAnim 
   forKey:nil];
  // 將目前結果紀錄進currentTransform
  currentTransform = rotateY3D;
}

- (IBAction)doRotateZ:(id)sender {
  // 建立旋轉的動畫
  CABasicAnimation* rotateAnim =  
  // 修改位移屬性
  [CABasicAnimation
   animationWithKeyPath:@"sublayerTransform"];
  // 確認動畫效果會持續
  rotateAnim.fillMode = kCAFillModeForwards;
  rotateAnim.removedOnCompletion = NO;  
  // 總共花了3秒
  rotateAnim.duration = 3.0;
  CATransform3D rotateZ3D = 
  CATransform3DRotate(currentTransform, M_PI/6, 0, 0, 1);
  NSValue* toValue = 
  [NSValue valueWithCATransform3D:rotateZ3D];
  // 設定終止點是封裝的點
  rotateAnim.toValue = toValue;
  [m_subLayer.layer 
   addAnimation:rotateAnim 
   forKey:nil];
  // 將目前結果紀錄進currentTransform
  currentTransform = rotateZ3D;
}

- (void)viewDidUnload
{
  [m_subLayer release];
  m_subLayer = nil;
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
  [m_subLayer release];
  [super dealloc];
}
@end
