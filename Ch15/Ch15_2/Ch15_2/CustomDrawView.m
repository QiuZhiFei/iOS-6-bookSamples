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
}

-(void) drawPath {
  // 新增貝式線的實例
  UIBezierPath* path = [UIBezierPath bezierPath];
  [path moveToPoint:CGPointMake(100.0f,0.0f)];
  [path addLineToPoint:CGPointMake(0.0f, 100.0f)];
  [path addLineToPoint:CGPointMake(100.0f, 100.0f)];
  //繪製路徑
  [path stroke];
  [self setNeedsLayout];
}
-(void) drawClosePath {
  // 新增貝式線的實例
  UIBezierPath* path = [UIBezierPath bezierPath];
  [path moveToPoint:CGPointMake(100.0f,150.0f)];
  [path addLineToPoint:CGPointMake(0.0f, 250.0f)];
  [path addLineToPoint:CGPointMake(100.0f, 250.0f)];
  // 封閉路徑
  [path closePath];
  //繪製路徑
  [path stroke];
  [self setNeedsLayout];  
}
-(void) fillClosePath {
  // 新增貝式線的實例
  UIBezierPath* path = [UIBezierPath bezierPath];
  [path moveToPoint:CGPointMake(250.0f,150.0f)];
  [path addLineToPoint:CGPointMake(150.0f, 250.0f)];
  [path addLineToPoint:CGPointMake(250.0f, 250.0f)];
  // 封閉路徑
  [path closePath];
  //填塗路徑
  [path fill];
  [self setNeedsLayout];  
}



@end
