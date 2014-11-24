//
//  AppDelegate.h
//  Ch10_2
//
//  Created by Ho Mark on 12/4/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

-(void) printUserDefault ;

@end
