//
//  AppDelegate.h
//  Ch19_2
//
//  Created by Ho Mark on 12/7/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
  // 取得外接營幕的實例
  UIScreen* externalScreen;
  // 取得外接視窗的實例
  UIWindow* externalWindow;  
}
// 偵測外接營幕
-(void) detechExternalScreen;
// 初始化外部營幕
-(void)initExternalScreenWithWidth: 
(int) width AndHeight:(int) height;
@property (strong, nonatomic) UIWindow *window;
// 讓 externalWindow能被外部存取
@property (strong, nonatomic) UIWindow* externalWindow;
@end
