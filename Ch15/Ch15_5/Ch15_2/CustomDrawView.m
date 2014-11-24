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
  [self drawSymbolAndRotate];
//  [self rotateDemo];
}

-(void) rotateDemo {
  // 增加一個符號
  UIBezierPath* path = [UIBezierPath bezierPath];
  //繪製簡單的三角型
  [path moveToPoint:CGPointMake(250.0, 0.0)];
  [path addLineToPoint:CGPointMake(250.0, 50.0)];
  [path addLineToPoint:CGPointMake(300.0, 50.0)];
  [path closePath];
  // 從三角型繪製一條對角線
  [path moveToPoint:CGPointMake(250.0, 50.0)];
  [path addLineToPoint:CGPointMake(300.0, 0.0)];
  // 先移到該座標軸
  CGAffineTransform rotateObject = 
  CGAffineTransformMakeTranslation(275, 25);
  // 進行旋轉
  rotateObject = 
  CGAffineTransformRotate(rotateObject, DEGREES_TO_RADIANS(45));
  // 轉完再把座標還原
  rotateObject = 
  CGAffineTransformTranslate(rotateObject, -275, -25);
  // 套用至路徑
  [path applyTransform:rotateObject];
  [path stroke];
  
}

-(void) drawCircle {
  UIBezierPath* path = [UIBezierPath bezierPath];
  //繪製一個圓形
  [path addArcWithCenter:CGPointMake(50.0f, 50.0f) 
                  radius:50.0f 
              startAngle:0 
                endAngle:2*M_PI 
               clockwise:NO];
  // 繪製該圓形
  [path stroke];
  [self setNeedsLayout];
}
-(void) drawSymbol {
  UIBezierPath* path = [UIBezierPath bezierPath];
  //繪製一個圓形
  // 繪製1/4弧
  [path addArcWithCenter:CGPointMake(50.0f, 50.0f) 
                  radius:50.0f 
              startAngle:0 
                endAngle:DEGREES_TO_RADIANS(270) 
               clockwise:NO];
  // 繪製另外1/4弧並連結
  [path addArcWithCenter:CGPointMake(50.0f, 50.0f) 
                  radius:50.0f 
              startAngle:DEGREES_TO_RADIANS(90)
                endAngle:DEGREES_TO_RADIANS(180) 
               clockwise:YES];
  /*
  // 關閉路徑
  [path closePath];
  // 繪製該圓形
  [path stroke];
  [path fill];
   */
  // 在block中實作路徑物件的位移
  void (^drawBlock)(int x, int y) = ^(int x, int y) {
    
    // 產生一組位移轉置矩陣
    CGAffineTransform trans = CGAffineTransformMakeTranslation(x, y);
    // 產生這組位移轉置矩陣的反矩
    CGAffineTransform revert = CGAffineTransformInvert(trans);
    // 套用在路徑物件
    [path applyTransform:trans];
    // 進行繪置
    [path stroke];
    [path fill];
    // 回到原點
    [path applyTransform:revert];
  };

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 4; j++) {
      drawBlock(i*110, j*110);
    }
    
  }
  [self setNeedsLayout];
}

-(void) drawSymbolAndScale {
  UIBezierPath* path = [UIBezierPath bezierPath];
  //繪製一個圓形
  // 繪製1/4弧
  [path addArcWithCenter:CGPointMake(50.0f, 50.0f) 
                  radius:50.0f 
              startAngle:0 
                endAngle:DEGREES_TO_RADIANS(270) 
               clockwise:NO];
  // 繪製另外1/4弧並連結
  [path addArcWithCenter:CGPointMake(50.0f, 50.0f) 
                  radius:50.0f 
              startAngle:DEGREES_TO_RADIANS(90)
                endAngle:DEGREES_TO_RADIANS(180) 
               clockwise:YES];
  /*
   // 關閉路徑
   [path closePath];
   // 繪製該圓形
   [path stroke];
   [path fill];
   */
  // 在block中實作路徑物件的位移
  void (^drawBlock)(int x, int y,float sx, float sy) =
  ^(int x, int y,float sx, float sy) {
    // 產生一組位移轉置矩陣
    CGAffineTransform trans = CGAffineTransformMakeTranslation(x, y);
    // 位移之後套用縮放
    trans = CGAffineTransformScale(trans, sx, sy);
    // 產生這組位移且縮放轉置矩陣的反矩
    CGAffineTransform revert = CGAffineTransformInvert(trans);
    // 套用在路徑物件
    [path applyTransform:trans];
    // 進行繪置
    [path stroke];
    [path fill];
    // 回到原點
    [path applyTransform:revert];
  };
  
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 4; j++) {
      // 每次x軸位移110個像素
      // y軸位移110個像素
      // 往x軸移時x的比例減少0.2
      // 往y軸移時y的比例減少0.2
      drawBlock(i*110, j*110, 1-i*0.2, 1-j*0.2);
    }
    
  }
  [self setNeedsLayout];
}


-(void) drawSymbolAndRotate {
  UIBezierPath* path = [UIBezierPath bezierPath];
  //繪製一個圓形
  // 繪製1/4弧
  [path addArcWithCenter:CGPointMake(50.0f, 50.0f) 
                  radius:50.0f 
              startAngle:0 
                endAngle:DEGREES_TO_RADIANS(270) 
               clockwise:NO];
  // 繪製另外1/4弧並連結
  [path addArcWithCenter:CGPointMake(50.0f, 50.0f) 
                  radius:50.0f 
              startAngle:DEGREES_TO_RADIANS(90)
                endAngle:DEGREES_TO_RADIANS(180) 
               clockwise:YES];

  // 在block中實作路徑物件的位移
  void (^drawBlock)(int x, int y,float theta) = 
  ^(int x, int y, float theta) {
    // 先使用位移矩陣移至x,y
    CGAffineTransform trans = 
    CGAffineTransformMakeTranslation(x, y);
    // 移到該物件的中心 
    CGAffineTransform rotateObject = 
    CGAffineTransformMakeTranslation(x+50, y+50);
    // 進行旋轉
    rotateObject = 
    CGAffineTransformRotate(rotateObject, theta);
    // 移回原點
    rotateObject = 
    CGAffineTransformTranslate(rotateObject, -x-50, -y-50);
    // 產生這組位移轉置矩陣的反矩
    CGAffineTransform revertTrans = 
    CGAffineTransformInvert(trans);
    // 產生旋轉的反矩陣
     CGAffineTransform revertRotate = 
    CGAffineTransformInvert(rotateObject);
    // 套用在路徑物件
    [path applyTransform:trans];
    [path applyTransform:rotateObject];
    // 進行繪置
    [path stroke];
    [path fill];
    // 回復旋轉的角度
    [path applyTransform:revertRotate];
    // 回復位移的距離差
    [path applyTransform:revertTrans];

  };
  
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 4; j++) {
      // 每一次移動30度
      float theta = DEGREES_TO_RADIANS((i+j*3)*30);
      drawBlock(i*110, j*110,theta);
    }
    
  }
 
  [self setNeedsLayout];
}
-(void) drawContinuousArc {
  UIBezierPath* path = [UIBezierPath bezierPath];
  //繪製連續的半弧
  [path addArcWithCenter:CGPointMake(160.0f, 60.0f) 
                  radius:50.0f 
              startAngle:M_PI 
                endAngle:0 
               clockwise:NO];
  [path addArcWithCenter:CGPointMake(260.0f, 60.0f) 
                  radius:50.0f 
              startAngle:M_PI 
                endAngle:0 
               clockwise:YES];
  
  // 移動到新的開始點
  [path moveToPoint:CGPointMake(310.0f, 150.0f)];
   
  [path addArcWithCenter:CGPointMake(260.0f, 150.0f) 
                  radius:50.0f 
              startAngle:0 
                endAngle:DEGREES_TO_RADIANS(270) 
               clockwise:NO];
  // 從弧形連結一條直線
  [path addLineToPoint:CGPointMake(260.0f, 300.0f)];
  // 從直線繪製另一條弧形
  [path addArcWithCenter:CGPointMake(260.0f, 250.0f) 
                  radius:50.0f 
              startAngle:DEGREES_TO_RADIANS(90) 
                endAngle:DEGREES_TO_RADIANS(270) 
               clockwise:YES];
  // 設定線的寬度為10
  path.lineWidth = 10;
  // 設定預設的端點的型態
  path.lineCapStyle = kCGLineCapButt;
  [path stroke];  
}
-(void) drawArc {
  // 繪製任意的弧形
  UIBezierPath* path2 = [UIBezierPath bezierPath];
  [path2 addArcWithCenter:CGPointMake(150.0f, 300.0f) 
                   radius:50.0f 
               startAngle:DEGREES_TO_RADIANS(37) 
                 endAngle:DEGREES_TO_RADIANS(293) 
                clockwise:YES]; 
  path2.lineWidth = 10;
  // 使用圓角的路徑端點
  path2.lineCapStyle=kCGLineCapRound;
  [path2 stroke];
  // 繪製任意的弧形
  UIBezierPath* path3 = [UIBezierPath bezierPath];
  [path3 addArcWithCenter:CGPointMake(50.0f, 350.0f) 
                   radius:50.0f 
               startAngle:DEGREES_TO_RADIANS(270) 
                 endAngle:DEGREES_TO_RADIANS(90) 
                clockwise:NO]; 
  path3.lineWidth = 15;
  // 使用矩形的路徑端點
  path3.lineCapStyle=kCGLineCapSquare;
  [path3 stroke];
  
  // 產生一條直線通過圓心，確認矩形路徑端點
  UIBezierPath* path4 = [UIBezierPath bezierPath];
  [path4 moveToPoint:CGPointMake(50.0f,200.0f)];
  [path4 addLineToPoint:CGPointMake(50.0f,450.0f)];
  [[UIColor greenColor] setStroke];
  [path4 stroke];

  [self setNeedsLayout];
}
-(void) affineTransform {
    UIBezierPath* path = [UIBezierPath bezierPath];
  [path applyTransform:CGAffineTransformMakeTranslation(0.0f, 100.0f)];
}
-(void) drawPath {
  // 新增貝式線的實例
  UIBezierPath* path = [UIBezierPath bezierPath];
  [path moveToPoint:CGPointMake(110.0f,10.0f)];
  [path addLineToPoint:CGPointMake(10.0f, 110.0f)];
  [path addLineToPoint:CGPointMake(110.0f, 110.0f)];
  // 封閉作出多邊型
  [path closePath];
  // 使用檔案作顏色填塗
  [[UIColor colorWithPatternImage:
    [UIImage imageNamed:@"wood.png"]] setFill];
  //填塗顏色
  [path fill];
  [self setNeedsLayout];
}
-(void) drawDashPath {
  // 定義一組虛線的樣式
  float pattern1[4] = {10, 20, 20, 10};
  // 新增貝式線的實例
  UIBezierPath* path = [UIBezierPath bezierPath];
  // 設定線寬
  path.lineWidth = 6.0;
  // 設定虛線的樣式
  [path setLineDash:pattern1 count:4 phase:0];
  [path moveToPoint:CGPointMake(250.0f,10.0f)];
  [path addLineToPoint:CGPointMake(150.0f, 110.0f)];
  [path addLineToPoint:CGPointMake(3200.0f, 110.0f)];
  // 自訂綠色的樣式並且填塗
  [[UIColor colorWithRed:0.0f 
                   green:1.0f 
                    blue:0.5f 
                   alpha:1.0f] setStroke];
  //繪製路徑
  [path stroke];
  [self setNeedsLayout];  
}
-(void) drawClosePath {
  // 新增貝式線的實例
  UIBezierPath* path = [UIBezierPath bezierPath];
  // 設定線寬
  path.lineWidth = 8.0;
  // 設定線寬交會處是平頭
  path.lineJoinStyle= kCGLineJoinBevel;
  [path moveToPoint:CGPointMake(100.0f,150.0f)];
  [path addLineToPoint:CGPointMake(0.0f, 250.0f)];
  [path addLineToPoint:CGPointMake(100.0f, 250.0f)];
  // 使用紅色作填塗
  [[UIColor redColor] setStroke];
  // 封閉路徑
  [path closePath];
  //繪製路徑
  [path stroke];
  [self setNeedsLayout];  
}
-(void) fillClosePath {
  // 新增貝式線的實例
  UIBezierPath* path = [UIBezierPath bezierPath];
  // 設定線寬
  path.lineWidth = 6.0;
  // 使用圓角的樣式
  path.lineJoinStyle= kCGLineJoinRound;
  [path moveToPoint:CGPointMake(250.0f,150.0f)];
  [path addLineToPoint:CGPointMake(150.0f, 250.0f)];
  [path addLineToPoint:CGPointMake(250.0f, 250.0f)];
  // 設定紅色為填塗的樣式
  [[UIColor redColor] setFill];
  // 設定灰色為路徑的樣式
  [[UIColor grayColor] setStroke];
  // 封閉路徑
  [path closePath];
  //填塗路徑
  [path fill];
  // 除了填塗同時也增加路徑
  [path stroke];
  [self setNeedsLayout];  
}



@end
