//
//  TouchImageView.m
//  Ch17_3
//
//  Created by Ho Mark on 12/7/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchImageView.h"
#import <QuartzCore/QuartzCore.h>

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
    // 設定長擊的手勢辨識
    UILongPressGestureRecognizer* longPressGestureRecognizer = 
    [[UILongPressGestureRecognizer alloc]
     initWithTarget:self action:@selector(handleLongPress:)];
    // 需要持續0.5秒的長壓
    longPressGestureRecognizer.minimumPressDuration = 0.5;
    // 不需要之前的點擊
    longPressGestureRecognizer.numberOfTapsRequired = 0;
    // 只需要單點觸控
    longPressGestureRecognizer.numberOfTouchesRequired = 1;
    // 加到這個類別中
    [self addGestureRecognizer:longPressGestureRecognizer];
    // 產生圖層的陰影
    self.layer.shadowColor = [UIColor redColor].CGColor;
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    [longPressGestureRecognizer release];

   }
  return self;
}

-(void) handleLongPress:(UILongPressGestureRecognizer*)longPressGestureRecognizer {
  if (longPressGestureRecognizer.state == UIGestureRecognizerStateBegan) {
    // 長壓事件發生
    [[NSNotificationCenter defaultCenter] 
     postNotificationName:@"longPressStart" object:nil];
    
  }if (longPressGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    // 使用者手放開
    [[NSNotificationCenter defaultCenter] 
     postNotificationName:@"longPressConfirm" object:nil];    
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
