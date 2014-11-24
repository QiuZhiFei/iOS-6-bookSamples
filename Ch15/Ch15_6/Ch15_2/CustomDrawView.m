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
 // [self drawQuadraticCurve2];
  [self drawCurve2];
}
-(void) drawQuadraticCurve {
  // 繪製曲線的block
  void (^drawCurve) (int,int) = ^(int y, int distance) {
    // 繪製一條曲線
    UIBezierPath* curve = [UIBezierPath bezierPath];
    [curve moveToPoint:CGPointMake(50.0, y)];
    // 新增控制點在中心的曲線
    [curve addQuadCurveToPoint:CGPointMake(270.0, y) 
                   controlPoint:CGPointMake(160.0, y+distance)];
    [curve stroke];
  };
  // 控制點在線段中心Y軸位移-200
  drawCurve (100,-200);
  
  // 控制點在線段中心Y軸位移-150
  drawCurve (150,-150);
  
  // 控制點在線段中心Y軸位移-100
  drawCurve (200,-100);
  
  // 控制點在線段中心Y軸位移-50
  drawCurve (250,-50);
  
  // 控制點在線段中心Y軸位移0
  drawCurve (300,0);
  
  // 控制點在線段中心Y軸位移50
  drawCurve (350,50);
  
  // 控制點在線段中心Y軸位移100
  drawCurve (400,100);
}
-(void) drawQuadraticCurve2 {
  // 繪製曲線的block
  void (^drawCurveWithOffset) (int,int) = ^(int y, int offset) {
    // 繪製一條曲線
    UIBezierPath* curve = [UIBezierPath bezierPath];
    [curve moveToPoint:CGPointMake(50.0, y)];
    // 新增控制點在中心的曲線
    [curve addQuadCurveToPoint:CGPointMake(270.0, y) 
                  controlPoint:CGPointMake(160.0+offset, y-110)];
    [curve stroke];
  };
  // 控制點在線段中心Y軸位移-250
  drawCurveWithOffset (80,-250);
  
  // 控制點在線段中心Y軸位移-200
  drawCurveWithOffset (140,-200);
  
  // 控制點在線段中心Y軸位移-100
  drawCurveWithOffset (200,-100);
  
  // 控制點在線段中心Y軸位移-0
  drawCurveWithOffset (260,-0);
  
  // 控制點在線段中心Y軸位移100
  drawCurveWithOffset (320,100);
  
  // 控制點在線段中心Y軸位移200
  drawCurveWithOffset (380,200);
  
  // 控制點在線段中心Y軸位移300
  drawCurveWithOffset (440,250);
  
}
-(void) drawCurve {
  // 繪製曲線的block
  void (^drawCurve) (int,CGPoint,CGPoint) = 
  ^(int y, CGPoint pt1, CGPoint pt2 ) {
    float dashPattern[2] = {5,5};
    // 繪製一條曲線
    UIBezierPath* curve = [UIBezierPath bezierPath];
    [curve moveToPoint:CGPointMake(20.0, y)];
    // 新增三次曲線
    [curve addCurveToPoint:CGPointMake(300.0, y) 
             controlPoint1:pt1 
             controlPoint2:pt2];
    curve.lineWidth = 3;
    [[UIColor blackColor]setStroke];
    [curve stroke];
    // 新增虛線的繪製
    UIBezierPath* dash = [UIBezierPath bezierPath];
    // 連結起點至控制點一
    [dash moveToPoint:CGPointMake(20.0,y)];
    [dash addLineToPoint:pt1];
    // 連結終點至控制點二
    [dash moveToPoint:CGPointMake(300.0, y)];
    [dash addLineToPoint:pt2];
    // 設置虛線的樣式
    dash.lineWidth = 3;
    [dash setLineDash:dashPattern count:2 phase:0];
    [[UIColor blueColor] setStroke];
    [dash stroke];
  };
  // 兩個點在同一點
  drawCurve (100,
             CGPointMake(160.0, 0.0),
             CGPointMake(160.0, 0.0));
  // 兩點位移80
  drawCurve (160,
             CGPointMake(120.0, 60.0),
             CGPointMake(200.0, 60.0));
  // 兩點位移160
  drawCurve (240,
             CGPointMake(80.0, 140.0),
             CGPointMake(240.0, 140.0));
  // 兩點位移240
  drawCurve (300,
             CGPointMake(40.0, 200.0),
             CGPointMake(280.0, 200.0));
  // 兩點位移320
  drawCurve (360,
             CGPointMake(0.0, 260.0),
             CGPointMake(320.0, 260.0));
  // 兩點位移400
  drawCurve (420,
             CGPointMake(-40.0, 320.0),
             CGPointMake(360.0, 320.0));


}
-(void) drawCurve2 {
  // 繪製曲線的block
  void (^drawCurve2) (int,CGPoint,CGPoint) = 
  ^(int y, CGPoint pt1, CGPoint pt2 ) {
    float dashPattern[2] = {5,5};
    // 繪製一條曲線
    UIBezierPath* curve = [UIBezierPath bezierPath];
    [curve moveToPoint:CGPointMake(20.0, y)];
    // 新增三次曲線
    [curve addCurveToPoint:CGPointMake(300.0, y) 
             controlPoint1:pt1 
             controlPoint2:pt2];
    curve.lineWidth = 3;
    [[UIColor blackColor]setStroke];
    [curve stroke];
    // 新增虛線的繪製
    UIBezierPath* dash = [UIBezierPath bezierPath];
    // 連結起點至控制點一
    [dash moveToPoint:CGPointMake(20.0,y)];
    [dash addLineToPoint:pt1];
    // 連結終點至控制點二
    [dash moveToPoint:CGPointMake(300.0, y)];
    [dash addLineToPoint:pt2];
    [dash moveToPoint:pt1];
    [dash addLineToPoint:pt2];
    // 設置虛線的樣式
    dash.lineWidth = 1;
    [dash setLineDash:dashPattern count:2 phase:0];
    [[UIColor blueColor] setStroke];
    [dash stroke];
  };
  // 兩個點在Y軸， X座標相同
  drawCurve2 (100,
             CGPointMake(160.0, 0.0),
             CGPointMake(160.0, 200.0));
  // 兩個點在Y軸， X座標相差120
  drawCurve2 (200,
              CGPointMake(100.0, 100.0),
              CGPointMake(220.0, 300.0));  
  // 兩個點在Y軸， X座標相差240
  drawCurve2 (300,
              CGPointMake(40.0, 200.0),
              CGPointMake(280.0, 400.0)); 
  // 兩個點在Y軸， X座標相差360
  drawCurve2 (400,
              CGPointMake(-20.0, 300.0),
              CGPointMake(340.0, 500.0)); 

}


@end
