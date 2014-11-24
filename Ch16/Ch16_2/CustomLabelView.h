//
//  CustomLabelView.h
//  Ch16_2
//
//  Created by Ho Mark on 12/6/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLabelView : UIView {
  // 畫面中的標籤
  UILabel* m_label;
}
// 設定該View顯示的文字
-(void) setDisplayText:(NSString *)displayText;

@end
