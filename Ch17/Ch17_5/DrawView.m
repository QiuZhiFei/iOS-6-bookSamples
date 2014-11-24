//
//  DrawView.m
//  Ch17_3
//
//  Created by Ho Mark on 12/7/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DrawView.h"

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
    // 新增一條線決定起點
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(startDraw:) 
     name:@"startPoint" 
     object:nil];
    // 連結到位移手勢新傳入的點
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(addPoint:) 
     name:@"addPoint" object:nil];

  }
  return self;
}

- (void)drawRect:(CGRect)rect
{
  // 在繪圖本文處繪製貝氏線
  // 使用綠色的線段
  [drawPath setLineWidth:5.0];
  [[UIColor greenColor]setStroke];
  [drawPath stroke];
}

-(void) startDraw:(NSNotification *)notification {
 
  // 取得CGPoint的NSValue物件
  NSValue* currentValue = 
  [[notification userInfo] 
   objectForKey:@"currentValue"];
  // 如果之前有繪製，就release
  if (drawPath) {
    [drawPath release];
    drawPath = nil;
  }
  // 新增貝氏線
  drawPath = [[UIBezierPath bezierPath] retain];
  // 設定起點
  [drawPath moveToPoint:currentValue.CGPointValue];
  [self setNeedsDisplay];
}

-(void) addPoint:(NSNotification *)notification {
  // 取得CGPoint的NSValue物件
  NSValue* currentValue = 
  [[notification userInfo] 
   objectForKey:@"currentValue"];
  // 設定連線至新的點
  [drawPath addLineToPoint:currentValue.CGPointValue];
  [self setNeedsDisplay];
}

@end
