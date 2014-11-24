//
//  TouchMoveView.m
//  Ch17_1
//
//  Created by Ho Mark on 12/7/5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchMoveView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TouchMoveView

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // 將圖檔讀成bgImage的UIImage物件
    UIImage* bgImage = [UIImage imageNamed:@"photo_300_270.png"];
    // 設定成底圖
    self.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    // 設定邊框顏色
    self.layer.borderColor = [UIColor redColor].CGColor;
    // 設定邊框寬度
    self.layer.borderWidth = 3.0f;
    // 設定圓角模式
    self.layer.cornerRadius = 25.0f;
  }
  return self;
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  // 取得觸控點
  CGPoint pt = [[touches anyObject] locationInView:self];
  // 將觸控點作為基準點
  startLocation = pt;
  // 產生動畫圖層
  [self generateCALayer];
  
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  // 取得觸控點
  CGPoint pt = [[touches anyObject] locationInView:self];
  // 計算和前一次的差值
  float dx = pt.x - startLocation.x;
  float dy = pt.y - startLocation.y;
  // 計算caLayer中心新的值
  CGPoint newcenter = CGPointMake(caLayer.position.x + dx,
                                  caLayer.position.y + dy);
  // 設定新的中心值  
  caLayer.position = newcenter;
  // 更新參考值
  startLocation = newcenter;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  // 中斷使用者輸入
  self.userInteractionEnabled = NO;
  // 動畫設定為五秒
  [CATransaction begin];
  [CATransaction setAnimationDuration:5.0];
  [CATransaction setCompletionBlock:^{
    // 結束後移動self至定點
    [self moveSelf];
    // 將動畫圖層移除
    [caLayer removeFromSuperlayer];
    [caLayer release];
  }];
  // 設定圖層完全透明
  caLayer.opacity = 0;
  // 邊框也變細
  caLayer.borderWidth = 0;
  [CATransaction commit];
}

-(void) generateCALayer {
  // 初始化CALayer
  // retain保持擁有權
  caLayer = [[CALayer layer]retain];
  // caLayer的frame是這個View的bounds
  caLayer.frame = self.bounds;
  // 設定背景色為透明
  caLayer.backgroundColor = 
  [UIColor clearColor].CGColor;
  // 設定同樣的圓角
  caLayer.cornerRadius = 25;
  // 設定邊緣顏色是藍色
  caLayer.borderColor = 
  [[UIColor blueColor] CGColor];
  // 設定線寬為20
  caLayer.borderWidth = 20;
  // 將圖層加入
  [self.layer addSublayer:caLayer];
}
-(void) moveSelf {
  //計算TouchMoveView的新中心
  CGPoint newCenter = 
  CGPointMake(self.frame.origin.x+caLayer.position.x,
              self.frame.origin.y+caLayer.position.y);
  // 將圖層移動到新位置
  // 使用三秒鐘
  [UIView 
   animateWithDuration:3.0 
   animations:^{
     self.center = newCenter;
   } completion:^(BOOL finished) {
     // 完成後重新接受使用者輸入
     self.userInteractionEnabled = YES;
   }
   ];
}

@end
