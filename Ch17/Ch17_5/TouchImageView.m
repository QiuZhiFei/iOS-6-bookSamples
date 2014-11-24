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
    // 新增一個旋轉的手勢辨識器
    UIRotationGestureRecognizer *rotationGestureRecognizer = 
    [[UIRotationGestureRecognizer alloc] 
     initWithTarget:self 
     action:@selector(handleRotation:)]; 

    // 加到這個類別中
    [self addGestureRecognizer:rotationGestureRecognizer];
    [rotationGestureRecognizer release];
  }
  return self;
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
