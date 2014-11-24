//
//  ViewController.m
//  Ch16_6
//
//  Created by Ho Mark on 12/7/1.
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
  [self initCALayer];
}

- (void)viewDidUnload
{
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

// 初如化CALayer
-(void) initCALayer {
  // 建立UIImage物件作為caLayer的內容
  UIImage* image = [UIImage imageNamed:@"book_photo.png"];
  // 取得CALayer的參照
  caLayer = [[CALayer layer] retain];
  // 設定邊界
  caLayer.bounds = CGRectMake(0, 0, 165, 218);
  // 設定圖形的內容
  caLayer.contents = (id)[image CGImage];
  // 設定圖形的位置
  caLayer.position = CGPointMake(83.0f, 100.0f);
  // 將它加進UIView的圖層中
  [self.view.layer addSublayer:caLayer];
  
}

- (IBAction)downPress:(id)sender {
  // 建立下移的動畫
  CABasicAnimation* moveDown =  
  // 指定動畫的屬性是position的Y屬性
  [CABasicAnimation
   animationWithKeyPath:@"position.y"];
  // 總共花了5秒
  moveDown.duration = 5.0;
  // 終點是目前的位置加100
  moveDown.toValue = 
  [NSNumber 
   numberWithInt:caLayer.position.y+100];
  // 啟動下移的動畫
  [caLayer addAnimation:moveDown 
                 forKey:@"moveDown"];
}

- (IBAction)upPress:(id)sender {
  // 建立上移的動畫
  CABasicAnimation* moveUp =  
  // 指定動畫的屬性是position的Y屬性
  [CABasicAnimation
   animationWithKeyPath:@"position.y"];
  // 總共花了5秒
  moveUp.duration = 5.0;
  // 終點是目前的位置減100  
  moveUp.toValue = 
  [NSNumber 
   numberWithInt:caLayer.position.y-100];
  // 啟動上移的動畫
  [caLayer addAnimation:moveUp 
                 forKey:@"moveUp"];
}

- (IBAction)stopDownPress:(id)sender {
  // 取消下移的動畫
  [caLayer removeAnimationForKey:@"moveDown"];
}

- (IBAction)stopUpPress:(id)sender {
  // 取消上移的動畫
  [caLayer removeAnimationForKey:@"moveUp"];
}

- (IBAction)downAndRightPress:(id)sender {
  // 建立下移和右移
  CABasicAnimation* moveDownRight =  
  // 修改位移屬性
  [CABasicAnimation
   animationWithKeyPath:@"position"];
  // 總共花了5秒
  moveDownRight.duration = 5.0;
  // 建立一個 NSValue物件封裝CGPointMake物件
  NSValue* endPoint = 
  [NSValue valueWithCGPoint:
   CGPointMake(caLayer.position.x+100, 
               caLayer.position.y+100)];
  // 設定終止點是封裝的點
  moveDownRight.toValue = endPoint;
  // 下移和右移
  [caLayer addAnimation:moveDownRight forKey:@"downAndRight"];
  
}

- (IBAction)upAndLeftPress:(id)sender {
  // 建立上移和左移
  CABasicAnimation* moveUpLeft =  
  [CABasicAnimation
   animationWithKeyPath:@"position"];
  // 修改位移屬性
  moveUpLeft.duration = 5.0;
  // 建立一個 NSValue物件封裝CGPointMake物件
  NSValue* point = 
  // 建立一個 NSValue物件封裝CGPointMake物件
  [NSValue valueWithCGPoint:
   CGPointMake(caLayer.position.x-100, 
               caLayer.position.y-100)];
  moveUpLeft.toValue = 
  [NSNumber 
   numberWithInt:caLayer.position.y+100];
  // 設定終止點是封裝的點
  moveUpLeft.toValue = point;
  // 上移和左移
  [caLayer addAnimation:moveUpLeft forKey:@"upAndLeft"];
}

- (IBAction)stopAllPress:(id)sender {
  [caLayer removeAllAnimations];
}

- (IBAction)twinkleFiveTimes:(id)sender {
  NSLog(@"開始進行閃動的動畫宣告");
  // 建立閃動的動畫
  CABasicAnimation* twinkle =  
  [CABasicAnimation
   animationWithKeyPath:@"opacity"];
  // 設定在一秒鐘的動畫
  twinkle.duration = 1;
  // 會將閃動回復到原本的完全不透明 
  twinkle.autoreverses = true;
  // 重覆執行五次
  twinkle.repeatCount = 5;
  // 設定動畫結束後物件變透明 
  twinkle.toValue = [NSNumber numberWithInt:0];
  // 設定動畫的代理物件如下
  twinkle.delegate = self;
  // 將動畫加到動畫物件圖層
  [caLayer addAnimation:twinkle forKey:@"twinkle"];
  NSLog(@"動畫已經加入圖層");

}

- (IBAction)keepDownAndRightPress:(id)sender {
  // 建立下移和右移
  CABasicAnimation* moveDownRight =  
  // 修改位移屬性
  [CABasicAnimation
   animationWithKeyPath:@"position"];
  // 將動畫效果保留
  moveDownRight.fillMode = kCAFillModeForwards;
  moveDownRight.removedOnCompletion = NO;
  // 總共花了3秒
  moveDownRight.duration = 3.0;
  // 建立一個 NSValue物件封裝CGPointMake物件
  NSValue* endPoint = 
  [NSValue valueWithCGPoint:
   CGPointMake(caLayer.position.x+80, 
               caLayer.position.y+330)];
  // 設定終止點是封裝的點
  moveDownRight.toValue = endPoint;
  // 下移和右移
  [caLayer addAnimation:moveDownRight forKey:@"downAndRight"];
}

- (IBAction)doSlide:(id)sender {
  // 建立一個關鍵畫面動畫
  CAKeyframeAnimation* keyFrameAnimation = 
  [CAKeyframeAnimation animationWithKeyPath:@"position"];
  // 動畫的時間是8秒
  keyFrameAnimation.duration = 8;
  keyFrameAnimation.fillMode = kCAFillModeForwards;
  keyFrameAnimation.removedOnCompletion = NO;

  // 創建的路徑是一條CGMutablePath
  CGMutablePathRef mutablePath =CGPathCreateMutable();
  // 設定路徑的
  CGPathMoveToPoint(mutablePath, NULL,
                    83.0, 100.0);
  // 將路徑的終點設至(163,430)
  // 同時使用二次貝民線，控制點是-100,430
  CGPathAddQuadCurveToPoint(mutablePath, NULL,
                            -100, 430, 163, 430);
  // 將路徑加到關鍵畫面動畫物件
  keyFrameAnimation.path = mutablePath;
  CGPathRelease(mutablePath);
  // 執行動畫
  [caLayer addAnimation:keyFrameAnimation forKey:nil];
}

- (IBAction)doTwinkleAndSlide:(id)sender {
  // 先建立關鍵畫面動畫
  // 建立一個關鍵畫面動畫
  CAKeyframeAnimation* keyFrameAnimation = 
  [CAKeyframeAnimation animationWithKeyPath:@"position"];
  // 動畫的時間是8秒
  keyFrameAnimation.duration = 8;
  
  // 創建的路徑是一條CGMutablePath
  CGMutablePathRef mutablePath =CGPathCreateMutable();
  // 設定路徑的
  CGPathMoveToPoint(mutablePath, NULL,
                    83.0, 100.0);
  // 將路徑的終點設至(163,430)
  // 同時使用二次貝民線，控制點是-100,430
  CGPathAddQuadCurveToPoint(mutablePath, NULL,
                            -100, 430, 163, 430);
  // 將路徑加到關鍵畫面動畫物件
  keyFrameAnimation.path = mutablePath;
  CGPathRelease(mutablePath);
  // 再來建立一個閃動動畫
  CABasicAnimation* twinkle =  
  [CABasicAnimation
   animationWithKeyPath:@"opacity"];
  // 設定在一秒鐘的動畫
  twinkle.duration = 1;
  twinkle.autoreverses = YES;
  twinkle.repeatCount = 2;
  // 設定動畫結束後物件變透明 
  twinkle.toValue = [NSNumber numberWithInt:0];
  // 加至CAAnimationGroup之中
  CAAnimationGroup* animations = [CAAnimationGroup animation];
  // 動畫群組的時間是8秒
  animations.duration = 8;
  // 將動畫加到動畫群組
  animations.animations = 
  [NSArray arrayWithObjects:keyFrameAnimation,twinkle, nil];
  
  // 加至caLayer之中
  [caLayer addAnimation:animations forKey:@"slideAndTwinkle"];


}

- (IBAction)doTwinkleThenSlide:(id)sender {
  // 建立一個動畫交易
  [CATransaction begin];
  // 設定完成時的函數
  [CATransaction setCompletionBlock:^{
    // 執行滑動，如同按下按鈕
    [self doSlide:nil];
  }];  

  // 再來建立一個閃動動畫
  CABasicAnimation* twinkle =  
  [CABasicAnimation
   animationWithKeyPath:@"opacity"];
  // 設定在一秒鐘的動畫
  twinkle.duration = 1;
  twinkle.autoreverses = YES;
  twinkle.repeatCount = 2;
  // 設定動畫結束後物件變透明 
  twinkle.toValue = [NSNumber numberWithInt:0];
  [caLayer addAnimation:twinkle forKey:nil];
  // 提交動畫
  [CATransaction commit];
  
}

- (IBAction)doSlideThenTwinkle:(id)sender {
  // 建立一個動畫交易
  [CATransaction begin];
  // 設定完成時的函數
  [CATransaction setCompletionBlock:^{
    // 執行閃爍，如同按下按鈕
    [self twinkleFiveTimes:nil];
  }];  
  
  // 建立一個關鍵畫面動畫
  CAKeyframeAnimation* keyFrameAnimation = 
  [CAKeyframeAnimation animationWithKeyPath:@"position"];
  // 動畫的時間是8秒
  keyFrameAnimation.duration = 8;
  // 將動畫的結果持續套用
  keyFrameAnimation.fillMode = kCAFillModeForwards;
  keyFrameAnimation.removedOnCompletion = NO;
   
  
  // 創建的路徑是一條CGMutablePath
  CGMutablePathRef mutablePath =CGPathCreateMutable();
  // 設定路徑的
  CGPathMoveToPoint(mutablePath, NULL,
                    83.0, 100.0);
  // 將路徑的終點設至(163,430)
  // 同時使用二次貝民線，控制點是-100,430
  CGPathAddQuadCurveToPoint(mutablePath, NULL,
                            -100, 430, 163, 430);
  // 將路徑加到關鍵畫面動畫物件
  keyFrameAnimation.path = mutablePath;
  CGPathRelease(mutablePath);
  // 執行動畫
  [caLayer addAnimation:keyFrameAnimation forKey:nil];
  // 提交動畫
  [CATransaction commit];

}


-(void) animationDidStart:(CAAnimation *)anim {
  NSLog(@"動畫開始");
}

-(void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
  if (!flag) {
    NSLog(@"動畫非正常結束");
    return;
  }
  NSLog(@"動畫結束");
  [caLayer removeFromSuperlayer];
  
}

- (void)dealloc {
  [super dealloc];
}
@end
