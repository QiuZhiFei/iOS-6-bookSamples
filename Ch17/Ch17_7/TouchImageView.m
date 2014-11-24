//
//  TouchImageView.m
//  Ch17_3
//
//  Created by Ho Mark on 12/7/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchImageView.h"
#import <QuartzCore/QuartzCore.h>
static float ANIMATION_DURATION = 5.0f;

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
    // 設定點擊的手勢辨識
    UITapGestureRecognizer* tapGestureRecognizer = 
    [[UITapGestureRecognizer alloc]
     initWithTarget:self action:@selector(handleTap:)];

    // 設定雙擊的點擊
    tapGestureRecognizer.numberOfTapsRequired =2;
    // 設定雙指觸控
    tapGestureRecognizer.numberOfTouchesRequired = 2;
    // 加到這個類別中
    [self addGestureRecognizer:tapGestureRecognizer];
    // 產生圖層的陰影
    self.layer.shadowColor = [UIColor blueColor].CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(5.0, -10.0);
    [tapGestureRecognizer release];

   }
  return self;
}
-(void)handleTap:(UITapGestureRecognizer*) tapGestureRecognizer {
  if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    // 增加能見度的動畫
    CABasicAnimation *shadowOpacity = 
    [CABasicAnimation animationWithKeyPath:@"shadowOpacity" ];
    [shadowOpacity setToValue:[NSNumber numberWithFloat:1.0]];
    [shadowOpacity setDuration:ANIMATION_DURATION];
    shadowOpacity.autoreverses = YES;
    // 增加陰影的動畫
    CABasicAnimation *shadowColor = 
    [CABasicAnimation animationWithKeyPath:@"shadowColor" ];
    shadowColor.toValue = (id) [UIColor greenColor].CGColor;
    [shadowColor setDuration:ANIMATION_DURATION];
    shadowColor.autoreverses = YES;
    // 增加陰影偏移值的動畫
    CABasicAnimation *shadowOffset = 
    [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    shadowOffset.toValue = 
    [NSValue valueWithCGSize:CGSizeMake(10.0,10.0)];
    shadowOffset.autoreverses = YES;
    [shadowOffset setDuration:ANIMATION_DURATION];
    
    // 將動畫加入TouchImageView的layer動畫圖層中
    [self.layer addAnimation:shadowOpacity forKey:nil];
    [self.layer addAnimation:shadowColor forKey:nil];
    [self.layer addAnimation:shadowOffset forKey:nil];
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
