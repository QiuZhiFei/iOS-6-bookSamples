//
//  TouchImageView.m
//  Ch17_3
//
//  Created by Ho Mark on 12/7/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchImageView.h"

@implementation TouchImageView

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
    // ImageView的子類別預設不接收輸入
    self.userInteractionEnabled = YES;
    // 新增手勢辨識器
    // 如果判定後呼叫handlePan:函數
    UIPanGestureRecognizer *panGestureRecognizer = 
    [[UIPanGestureRecognizer alloc] 
     initWithTarget:self 
     action:@selector(handlePan:)]; 
    // 設定為單點的位移手勢
    panGestureRecognizer.minimumNumberOfTouches=1;
    panGestureRecognizer.maximumNumberOfTouches=1;
    // 加到這個類別中
    [self addGestureRecognizer:panGestureRecognizer];
    [panGestureRecognizer release];
  }
  return self;
}


- (void) handlePan: (UIPanGestureRecognizer *) panGestureRecognizer {
  
  if (panGestureRecognizer.state == 
      UIGestureRecognizerStateBegan) {
    // 紀錄目前的位置
    currentLocation = self.center;
    // 將CGPoint包成NSValue
    // 並且裝入NSDictionary中
    NSValue* currentValue = 
    [NSValue valueWithCGPoint:currentLocation];
    NSDictionary* dict = 
    [NSDictionary dictionaryWithObject:currentValue 
                                forKey:@"currentValue"];
    // 發送startPoint的告知
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"startPoint" 
     object:nil userInfo:dict];
    
  }else if (panGestureRecognizer.state == 
            UIGestureRecognizerStateChanged) {
    // 取得手勢的位移值
    CGPoint translation = 
    [panGestureRecognizer translationInView:self.superview]; 
    // 將自己進行位移
    self.center = 
    CGPointMake(currentLocation.x + translation.x, 
                currentLocation.y + translation.y);   
    // 將CGPoint包成NSValue
    // 並且裝入NSDictionary中
    NSValue* currentValue = 
    [NSValue valueWithCGPoint:self.center];
    NSDictionary* dict = 
    [NSDictionary dictionaryWithObject:currentValue 
                                forKey:@"currentValue"];
    // 發送addPoint的告知
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"addPoint" 
     object:nil userInfo:dict];
  }else if (panGestureRecognizer.state == 
            UIGestureRecognizerStateEnded) {
    // 不需要特別的處理
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
