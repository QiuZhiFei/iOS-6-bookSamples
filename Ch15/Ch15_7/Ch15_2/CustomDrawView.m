//
//  CustomDrawView.m
//  Ch15_2
//
//  Created by Ho Mark on 12/6/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomDrawView.h"
#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)
@implementation CustomDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  [self usingCGFramework];
}

-(void) usingCGFramework {
  // 設定虛線的樣式
  float pattern[2] = {5,5};
  // 分別新增矩形和橢圓形的貝氏線
  UIBezierPath* rectPath = [UIBezierPath bezierPath];
  UIBezierPath* ellipsePath = [UIBezierPath bezierPath];
  // 建立兩者的CGMutablePathRef變數
  CGMutablePathRef rectPathRef = CGPathCreateMutable();
  CGMutablePathRef ellipsePathRef = CGPathCreateMutable();
  // 使用block將橢圓形和矩形的路徑加入
  void (^drawEllipseAndBoundingBox)(CGRect) = 
  ^(CGRect boundingBox) {
    CGPathAddEllipseInRect(ellipsePathRef, nil, boundingBox);
    CGPathAddRect(rectPathRef, nil, boundingBox);
  };
  // 繪製四個不同大小的橢圓形和外框
  drawEllipseAndBoundingBox(CGRectMake(110, 10, 80, 80));

  drawEllipseAndBoundingBox(CGRectMake(85, 110, 150, 80));  

  drawEllipseAndBoundingBox(CGRectMake(60, 210, 200, 80));
  
  drawEllipseAndBoundingBox(CGRectMake(35, 310, 250, 80));
  
  // 將CGMutablePathRef變數加至UIBezierPath變數
  rectPath.CGPath = rectPathRef;
  ellipsePath.CGPath = ellipsePathRef;
  // 設定虛線樣式
  [rectPath setLineDash:pattern count:2 phase:0];
  //將結果繪製出來
  [rectPath stroke];
  [ellipsePath stroke];
  CGPathRelease(rectPathRef);
  CGPathRelease(ellipsePathRef);
  

  [self setNeedsDisplay];
  
}

@end
