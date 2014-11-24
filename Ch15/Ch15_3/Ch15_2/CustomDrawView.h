//
//  CustomDrawView.h
//  Ch15_2
//
//  Created by Ho Mark on 12/6/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomDrawView : UIView {
  
}
-(void) drawPath; //繪製路徑
-(void) drawDashPath; //繪製路徑
-(void) drawClosePath; // 繪製封閉區域
-(void) fillClosePath; // 填塗封閉區域

@end
