//
//  TouchDrawView.m
//  Ch11_12
//
//  Created by Ho Mark on 12/7/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchDrawView.h"

@implementation TouchDrawView

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

  }
  return self;
}
- (BOOL) isMultipleTouchEnabled {
  // 開啟多點觸控
  return YES;
}

-(void) touchesBegan:(NSSet *)touches 
           withEvent:(UIEvent *)event {
  [self beginDrawPath:touches];
  [self setNeedsDisplay];
  
}
-(void) touchesMoved:(NSSet *)touches 
           withEvent:(UIEvent *)event {
  [self addTouchPointToPath:touches];
  [self setNeedsDisplay];

}
-(void) touchesEnded:(NSSet *)touches 
           withEvent:(UIEvent *)event {      
  [self addTouchPointToPath:touches];
  [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
  for(NSString* addressKey in m_touchDictionary) {
    // 取出貝氏線
    UIBezierPath* path = 
    [m_touchDictionary objectForKey:addressKey];
    // 取出顏色
    UIColor* currentColor = 
    [m_pathColor objectForKey:addressKey];
    // 設置顏色
    [currentColor setStroke];
    // 進行繪製
    [path stroke];
  }
}

-(void) beginDrawPath:(NSSet*)touches {
  // 清空之前的Dictionary
  if (m_touchDictionary) {
    [m_touchDictionary release];
    m_touchDictionary = nil;
  }
  if (m_pathColor) {
    [m_pathColor release];
    m_pathColor = nil;
  }
  // 初始化Dictionary
  m_touchDictionary = [[NSMutableDictionary alloc]init];
  m_pathColor = [[NSMutableDictionary alloc]init];
  // 將觸控點分別加入
  for (UITouch* touch in touches) {
    // 取得觸控事件的記憶體位址
    NSString* addressKey = [NSString stringWithFormat:@"%p",touch];
    // 取得觸控點
    CGPoint pt = [touch locationInView:self];
    // 初始化貝氏線
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 1;
    [bezierPath moveToPoint:pt];
    // 亂數取得貝氏線的顏色
    UIColor* currentColor = 
    [UIColor colorWithRed:(float)rand() / RAND_MAX
                    green:(float)rand() / RAND_MAX
                     blue:(float)rand() / RAND_MAX
                    alpha:1.0f];
    // 將貝氏線加入字典
    [m_touchDictionary setObject:bezierPath forKey:addressKey];
    // 將顏色加入字典
    [m_pathColor setObject:currentColor forKey:addressKey];
  }
  
  
}
-(void) addTouchPointToPath:(NSSet*) touches {
  // 迭代所有的觸控點
  for (UITouch* touch in touches) {
    // 取得觸控事件的記憶體位址
    NSString* addressKey = 
    [NSString stringWithFormat:@"%p",touch];
    // 取得對應的貝氏線
    UIBezierPath* currentPath = 
    [m_touchDictionary objectForKey:addressKey];
    if (currentPath) {
      // 將點加入路徑
      CGPoint pt = [touch locationInView:self];
      [currentPath addLineToPoint:pt];
    }
  }
 
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
