//
//  AppDelegate.h
//  Ch7_4
//
//  Created by Ho Mark on 12/4/2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate, 
UITabBarControllerDelegate> {
  UINavigationController* navigationController;
  NSString* currentValue; // 可被其它類別存取
  
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
// 開發者自定屬性
@property (nonatomic, retain) UINavigationController* navigationController;
@property (nonatomic, retain) NSString* currentValue;
@end


