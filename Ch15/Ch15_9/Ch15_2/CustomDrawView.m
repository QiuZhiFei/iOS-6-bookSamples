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

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // 設定這個 View的色彩填塗樣式
    self.backgroundColor = 
    [UIColor colorWithPatternImage:
     [UIImage imageNamed:@"leather.png"]];
  }
  return self;
  
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  // 取得繪圖本文
  CGContextRef aRef = UIGraphicsGetCurrentContext();
  // 多重調和模式
//  CGContextSetBlendMode(aRef, kCGBlendModeMultiply);
  // 使用差異調和模式
    CGContextSetBlendMode(aRef, kCGBlendModeDifference);
  //  CGContextSetBlendMode(aRef, kCGBlendModeExclusion);
  //   CGContextSetBlendMode(aRef, kCGBlendModeColor);
  // 進行繪圖
  // 順序會影響結果
  [self drawHorizontal];
  [self drawVertical];
  
}

-(void) drawHorizontal {
  //繪製條紋的block
  void (^drawHorizontalTile)(int,UIColor*) = 
  ^(int startY,UIColor* rectColor) {
    // 繪製水平矩形
    UIBezierPath* rectPath = [UIBezierPath bezierPath];
    CGMutablePathRef rectPathRef = CGPathCreateMutable();
    CGPathAddRect(rectPathRef, nil, 
                  CGRectMake(0, startY, 320, 30));
    rectPath.CGPath = rectPathRef;
    // 設定填塗的顏色
    [rectColor setFill];
    [rectPath fill];
    CGPathRelease(rectPathRef);
  };
  // 每隔60個點繪製不同顏色的橫置矩形
  drawHorizontalTile(0,[UIColor redColor]);
  drawHorizontalTile(60,[UIColor greenColor]);
  drawHorizontalTile(120,[UIColor yellowColor]);
  drawHorizontalTile(180,[UIColor blueColor]);
  drawHorizontalTile(240,[UIColor purpleColor]);
  drawHorizontalTile(300,[UIColor cyanColor]);
  drawHorizontalTile(360,[UIColor magentaColor]);
  drawHorizontalTile(420,
    [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood.png"]]);
  
}
-(void) drawVertical {
  //繪製垂直矩形的block
  void (^drawVerticalTile)(int,UIColor*) = 
  ^(int startX,UIColor* rectColor) {
    // 繪製垂直矩形
    UIBezierPath* rectPath = [UIBezierPath bezierPath];
    CGMutablePathRef rectPathRef = CGPathCreateMutable();
    CGPathAddRect(rectPathRef, nil, 
      CGRectMake(startX, 0, 30, 460));
    rectPath.CGPath = rectPathRef;
    // 設定填塗的顏色
    [rectColor setFill];
    [rectPath fill];
    CGPathRelease(rectPathRef);
  };
  // 每隔60個點繪製不同顏色的橫置矩形
  drawVerticalTile(0,[UIColor redColor]);
  drawVerticalTile(60,[UIColor greenColor]);
  drawVerticalTile(120,[UIColor yellowColor]);
  drawVerticalTile(180,[UIColor blueColor]);
  drawVerticalTile(240,[UIColor purpleColor]);
  drawVerticalTile(300,[UIColor cyanColor]);
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
