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
    // 新增一個縮放的手勢辨識器
    UIPinchGestureRecognizer *pinchGestureRecognizer = 
    [[UIPinchGestureRecognizer alloc]
     initWithTarget:self 
     action:@selector(handleScale:)];
    // 加到這個類別中
    [self addGestureRecognizer:pinchGestureRecognizer];
    [pinchGestureRecognizer release];
  }
  return self;
}

- (void) handleScale: (UIPinchGestureRecognizer*) pinchGestureRecognizer {
  if (pinchGestureRecognizer.state == 
      UIGestureRecognizerStateBegan) {
    
  } else if (pinchGestureRecognizer.state == 
             UIGestureRecognizerStateChanged) {
    // 如果縮放小於0.7倍而且還要再縮小就維持原比例
    // 預防過小而無法操綜
    if (self.transform.a < 0.7 && 
        pinchGestureRecognizer.scale < 1) {
      return;
    }
    // 將X和Y都等比例縮放
    self.transform = 
    CGAffineTransformScale(self.transform, 
                           pinchGestureRecognizer.scale,
                           pinchGestureRecognizer.scale); 
    // 將縮放的比例傳入訊息告知之中
    // self.transform.a是指X的縮放比
    NSDictionary* userInfo = 
    [NSDictionary dictionaryWithObject:
     [NSNumber numberWithFloat:self.transform.a] 
      forKey:@"currentValue"];
    // 傳送setSize至訊息的告知中心 
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"setSize" object:nil userInfo:userInfo];
    
  } else if (pinchGestureRecognizer.state == 
             UIGestureRecognizerStateEnded) {

  }

}

- (void) handleRotation: (UIRotationGestureRecognizer*) rotationGestureRecognizer {
  if (rotationGestureRecognizer.state == 
      UIGestureRecognizerStateBegan) {

  } else if (rotationGestureRecognizer.state == 
             UIGestureRecognizerStateChanged) {
    // 將旋轉的角度作套用
    self.transform = 
    CGAffineTransformRotate(self.transform, 
                            rotationGestureRecognizer.rotation);  
  } else if (rotationGestureRecognizer.state == 
             UIGestureRecognizerStateEnded) {
    
    [UIView animateWithDuration:5.0 animations:^{
      self.transform = CGAffineTransformIdentity;
    }];
    
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
