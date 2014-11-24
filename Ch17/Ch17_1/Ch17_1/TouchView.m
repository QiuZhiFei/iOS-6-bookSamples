//
//  TouchView.m
//  Ch17_1
//
//  Created by Ho Mark on 12/7/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // 新增標籤識別偵錯訊息
    m_label = 
    [[NSString stringWithFormat:@"TouchView(%d)",self.tag]
     retain];    
    // 初始化可變動陣列
    m_movePoints = [[NSMutableArray alloc]init];
  }
  return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  // 壓下只有一個點
  UITouch* touch = [touches anyObject];
  // 傾印出這個點的資訊
  NSLog(@"%@在 (%.1f,%.1f)有壓下的事件",
        m_label,
        [touch locationInView:self].x,
        [touch locationInView:self].y);
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  // 將移動的點加到m_movePoints中
  for(UITouch* touch in touches) {
    [m_movePoints addObject:touch];
  }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  // 傾印出移動的點
  // 產生輸出訊息
  NSString* moveTrack = [NSString stringWithFormat:@"%@",m_label];
  for (UITouch* touch in m_movePoints) {
    moveTrack = 
    [moveTrack stringByAppendingFormat:@"=>(%.1f,%.1f)",
     [touch locationInView:self].x,
     [touch locationInView:self].y];
    
  }
  // 如果有移動就將訊息輸出
  if ([m_movePoints count]>0) {
    NSLog(@"%@",moveTrack);    
  }
  [m_movePoints removeAllObjects];
  // 將觸控結束的點印出
  UITouch* touch = [touches anyObject];
  NSLog(@"%@在(%.1f,%.1f)結束",m_label,
        [touch locationInView:self].x,
        [touch locationInView:self].y);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
