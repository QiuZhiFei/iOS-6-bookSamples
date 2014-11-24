//
//  DrawView.m
//  Ch17_3
//
//  Created by Ho Mark on 12/7/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DrawView.h"
#import <QuartzCore/QuartzCore.h>
@implementation DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    //  聆聽長壓事件開始的訊息
    [[NSNotificationCenter defaultCenter]
     addObserver:self 
     selector:@selector(generateCAShapeLayer) 
     name:@"longPressStart" 
     object:nil];
    
    // 聆聽長壓事件結束的訊息
    [[NSNotificationCenter defaultCenter]
     addObserver:self 
     selector:@selector(animateCAShapeLayer) 
     name:@"longPressConfirm" 
     object:nil];
     

  }
  return self;
}



-(void) generateCAShapeLayer {
  // 產生一個CAShapeLayer的實例
  shapeLayer = [[CAShapeLayer layer]retain];
  // 畫一個圓形
  UIBezierPath* path = 
  [UIBezierPath 
   bezierPathWithArcCenter:CGPointMake(160.0, 235.0) 
                    radius:160.0 startAngle:0.0 
                  endAngle:2*M_PI 
                 clockwise:YES];
  // 設定這個CAShapeLayer的圖形的CGPath
  shapeLayer.path = path.CGPath;
  // 將這層layer設定成背景不要蓋住TouchImageView
  shapeLayer.zPosition = -1;
  // 設定填塗顏色是黃色
  shapeLayer.fillColor = [UIColor yellowColor].CGColor;
  // 加入DrawView的畫面中
  [self.layer addSublayer:shapeLayer];
}
-(void) animateCAShapeLayer {
  // 將兩個動畫裝置在同一個交易中
  [CATransaction begin];
  [CATransaction setCompletionBlock:^{
    // 動畫完成移除這個動畫圖層
    [shapeLayer release];
    [shapeLayer removeFromSuperlayer];
  }];
  // 漸變這個圖層的路徑
  // 繪製一個非常小的圓
  CABasicAnimation* pathAnim = 
  [CABasicAnimation animationWithKeyPath:@"path"];
    UIBezierPath* path = [UIBezierPath 
                          bezierPathWithArcCenter:CGPointMake(160.0, 235.0) 
                          radius:0.1 
                          startAngle:0.0 
                          endAngle:2*M_PI 
                          clockwise:YES];
  pathAnim.toValue = (id)path.CGPath;
  // 在五秒內完成
  [pathAnim setDuration:5.0];
  [shapeLayer addAnimation:pathAnim forKey:nil];
  // 漸變這個動畫圖層的顏色
  CABasicAnimation* colorAnim = 
  [CABasicAnimation animationWithKeyPath:@"fillColor"];
  colorAnim.toValue = (id) [UIColor blueColor].CGColor;
  [colorAnim setDuration:5.0];
  [shapeLayer addAnimation:colorAnim forKey:nil];
  [CATransaction commit];
}
@end
