//
//  DrawView.h
//  Ch17_3
//
//  Created by Ho Mark on 12/7/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView{
  // 這個View的貝氏線
  UIBezierPath* drawPath;
}
// 開始一條貝氏線
-(void) startDraw:(NSNotification *)notification;
// 將這條線連至新的點
-(void) addPoint:(NSNotification *)notification;
@end
