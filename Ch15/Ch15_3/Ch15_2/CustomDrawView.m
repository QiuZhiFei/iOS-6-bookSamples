//
//  CustomDrawView.m
//  Ch15_2
//
//  Created by Ho Mark on 12/6/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomDrawView.h"

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
  [self drawPath];
  [self drawClosePath];
  [self fillClosePath];
  [self drawDashPath];
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
