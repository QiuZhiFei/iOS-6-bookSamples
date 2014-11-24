//
//  AppDelegate.h
//  fbConn
//
//  Created by Ho Mark on 12/7/30.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
@interface AppDelegate : UIResponder
<UIApplicationDelegate,FBSessionDelegate> {
  Facebook* facebook;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Facebook *facebook;
-(void) getFacebookStatus;
@end
