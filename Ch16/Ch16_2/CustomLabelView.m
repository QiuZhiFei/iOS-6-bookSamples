//
//  CustomLabelView.m
//  Ch16_2
//
//  Created by Ho Mark on 12/6/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomLabelView.h"

@implementation CustomLabelView
- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // 初始化標籤
    m_label = [[UILabel alloc]initWithFrame:CGRectMake(10.0, 10.0, 300.0, 200.0)];
    m_label.numberOfLines = 0;
    m_label.text = @"封面";
    m_label.backgroundColor = [UIColor clearColor];
    m_label.font = [UIFont systemFontOfSize:36];
    m_label.textColor = [UIColor blackColor];
    // 將標籤加入畫面
    [self addSubview:m_label];
    [m_label release];
    // 設定該視窗元件的背景圖
    self.backgroundColor = 
    [UIColor colorWithPatternImage:[UIImage imageNamed:@"paper.png"]];
  }
  return self;
}

// 設定標籤顯示的文字
-(void) setDisplayText:(NSString *)displayText {
  m_label.text = displayText;
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
