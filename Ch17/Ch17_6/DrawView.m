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
    // 設定聆聽setSize的訊息
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(setSize:) 
     name:@"setSize" object:nil];
  }
  return self;
}


-(void) setSize:(NSNotification *)notification {
  // 依照比例設定UIScrollView的畫面大小
  NSNumber* currentValue = 
  [[notification userInfo] 
   objectForKey:@"currentValue"];
  self.contentSize = CGSizeMake(300*currentValue.floatValue ,
                                270*currentValue.floatValue);

}

@end
