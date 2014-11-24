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
    // 新增往右滑手勢辨識器
    // 如果判定後呼叫handlePan:函數
    UISwipeGestureRecognizer *rSwipeGestureRecognizer = 
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self 
     action:@selector(yMirror:)];
    // 設定為單點的位移手勢
    rSwipeGestureRecognizer.numberOfTouchesRequired = 1;
    rSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    // 加到這個類別中
    [self addGestureRecognizer:rSwipeGestureRecognizer];
    [rSwipeGestureRecognizer release];
    // 新增往左滑手勢辨識器
    UISwipeGestureRecognizer *lSwipeGestureRecognizer = 
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self 
     action:@selector(yMirror:)];
    // 設定為單點的位移手勢
    lSwipeGestureRecognizer.numberOfTouchesRequired = 1;
    lSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    // 加到這個類別中
    [self addGestureRecognizer:lSwipeGestureRecognizer];
    [lSwipeGestureRecognizer release];
    // 新增往上滑手勢辨識器
    UISwipeGestureRecognizer *uSwipeGestureRecognizer = 
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self 
     action:@selector(xMirror:)];
    // 設定為單點的位移手勢
    uSwipeGestureRecognizer.numberOfTouchesRequired = 1;
    uSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    // 加到這個類別中
    [self addGestureRecognizer:uSwipeGestureRecognizer];
    [uSwipeGestureRecognizer release];
    // 新增往下滑手勢辨識器
    UISwipeGestureRecognizer *dSwipeGestureRecognizer = 
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self 
     action:@selector(xMirror:)];
    // 設定為單點的位移手勢
    dSwipeGestureRecognizer.numberOfTouchesRequired = 1;
    dSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    // 加到這個類別中
    [self addGestureRecognizer:dSwipeGestureRecognizer];
    [dSwipeGestureRecognizer release];
  }
  return self;
}
-(void)yMirror:(UISwipeGestureRecognizer*) swipeGestureRecognizer {
  // 產生Y軸的鏡像
  CGAffineTransform mirrorY = 
  CGAffineTransformScale(self.transform, -1.0, 1.0);
  // 進行動畫的運算
  [UIView animateWithDuration:1.0 animations:^{
    self.transform = mirrorY;
  }];

}
-(void)xMirror:(UISwipeGestureRecognizer*) swipeGestureRecognizer {
  // 產生X軸的鏡像
  CGAffineTransform mirrorX = 
  CGAffineTransformScale(self.transform, 1.0, -1.0);
  // 進行動畫的運算
  [UIView animateWithDuration:1.0 animations:^{
    self.transform = mirrorX;
  }];
  
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
