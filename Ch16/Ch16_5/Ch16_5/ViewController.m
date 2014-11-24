//
//  ViewController.m
//  Ch16_5
//
//  Created by Ho Mark on 12/6/29.
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
  [self initCAReplicationLayer];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) initCAReplicationLayer {
  // 初始化CAReplicatorLayer
  replicatorLayer = [[CAReplicatorLayer layer] retain];
  // 設定這個Layer的範圍
  replicatorLayer.bounds = CGRectMake(0, 0, 320, 250); 
  replicatorLayer.position = CGPointMake(160, 125);
  // 設定複本數為4
  replicatorLayer.instanceCount = 4;
  // 每一個複本的X位移是40, Y位移是70
  CATransform3D finalTransform = CATransform3DMakeTranslation(40.0, 70.0, 0.0);
  // 每一個複本的紅色減低0.25
  replicatorLayer.instanceRedOffset = -.25;
  // 複本進行位置的轉換
  [replicatorLayer setInstanceTransform:finalTransform]; 
  // 建立UIImage物件作為caLayer的內容
  UIImage* image = [UIImage imageNamed:@"book_photo.png"];
  // 取得CALayer的參照
  CALayer* caLayer = [CALayer layer];
  // 設定邊界
  caLayer.bounds = CGRectMake(0, 0, 165, 218);
  // 設定圖形的內容
  caLayer.contents = (id)[image CGImage];
  // 設定圖形的位置
  caLayer.position = CGPointMake(82.0f,114.0f);
  // 將圖層加入複本之中
  [replicatorLayer addSublayer:caLayer];
  // 將複本加入主畫面中
  [self.view.layer addSublayer:replicatorLayer];

}

- (IBAction)doMerge:(id)sender {  
  // 修改動畫的交易時間為五秒鐘
  [CATransaction setAnimationDuration:5.0];
  // 將物件移回原點，並且重疊在z軸
  CATransform3D finalTransform = CATransform3DMakeTranslation(0.0, 0.0, 0.1);
  [replicatorLayer setInstanceTransform:finalTransform];
  // 將透明度漸漸增加
  replicatorLayer.instanceAlphaOffset = -0.1;
  // 產生不同的顏色色差
  NSInteger r1 = arc4random() % 100;
  NSInteger r2 = arc4random() % 100;
  NSInteger r3 = arc4random() % 100;
  float x1 = r1/200.0;
  float x2 = r2/200.0;
  float x3 = r3/200.0;
  replicatorLayer.instanceGreenOffset = -x1;
  replicatorLayer.instanceRedOffset = -x2;
  replicatorLayer.instanceBlueOffset = -x3;
}

- (IBAction)doSplit:(id)sender {
  // 修改動畫的交易時間為五秒鐘
  [CATransaction setAnimationDuration:5.0];
  // 將物件移回原本散開的位置 
  CATransform3D finalTransform = CATransform3DMakeTranslation(40.0, 70.0, 0.0);
  [replicatorLayer setInstanceTransform:finalTransform];
  // 將透明度漸漸減少並還原
  replicatorLayer.instanceAlphaOffset = 0.1;
// 產生不同的顏色色差
  NSInteger r1 = arc4random() % 100;
  NSInteger r2 = arc4random() % 100;
  NSInteger r3 = arc4random() % 100;
  float x1 = r1/200.0;
  float x2 = r2/200.0;
  float x3 = r3/200.0;
  replicatorLayer.instanceGreenOffset = -x1;
  replicatorLayer.instanceRedOffset = -x2;
  replicatorLayer.instanceBlueOffset = -x3;
   [CATransaction commit];

}

@end
