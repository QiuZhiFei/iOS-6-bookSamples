//
//  TouchVerifyImageView.m
//  Ch17_2
//
//  Created by Ho Mark on 12/7/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchVerifyImageView.h"
#import <QuartzCore/QuartzCore.h>
@implementation TouchVerifyImageView

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
    // UIImageView預設是不讓使用者互動
    // 也就是不接受使用者輸入
    // 所以要自行將它修改成接受使用者輸入
    self.userInteractionEnabled = YES;

  }
  return self;
}

-(BOOL) pointInside:(CGPoint)point withEvent:(UIEvent *)event {
  BOOL result = [super pointInside:point withEvent:event];
  // 計算觸控點和圓心X軸的距離
  float xDelta = point.x-120.0;
  // 計算觸控點和圓心Y軸的距離
  float yDelta = point.y-120.0;
  // 進行判定
  if (result == YES) {
    if ((xDelta*xDelta+yDelta*yDelta) < 14400) {
      // 小於半徑就是觸控發生在區域內 
      [[NSNotificationCenter defaultCenter]    
       postNotificationName:@"clickInside" 
       object:nil];
      [self clickInside];
      
    } else {
      // 大於半徑就是觸控發生在區域外
      [[NSNotificationCenter defaultCenter]    
       postNotificationName:@"clickOutside" 
       object:nil];
      [self clickOutside];
    }
    
  } else {
  }
  return result;
  
}

-(void) clickInside {
  // 觸控在區域內將背景變成藍色的
  self.backgroundColor = [UIColor blueColor];
}
-(void) clickOutside {
  // 觸控在區域內將背景變成紅色的
  self.backgroundColor = [UIColor redColor];
}



@end
