//
//  TouchDrawView.h
//  Ch11_12
//
//  Created by Ho Mark on 12/7/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchDrawView : UIView {
  // 依照觸控物件存放貝氏線
  NSMutableDictionary* m_touchDictionary;
  // 依照觸控物件存放顏色
  NSMutableDictionary* m_pathColor;
}
// 初始化貝氏線與顏色 
-(void) beginDrawPath:(NSSet*)touches;
// 依照觸控點增加線段
-(void) addTouchPointToPath:(NSSet*) touches;

@end
