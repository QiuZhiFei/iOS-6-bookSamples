//
//  AppDelegate.h
//  Ch14_14
//
//  Created by Ho Mark on 12/6/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
  NSString* prefix;
}

@property (strong, nonatomic) UIWindow *window;
-(void) execBlockInMainQueue;
-(void) execBlockInGlobalQueue;
-(void) execBlockInCustomQueue;
-(void) execBlockSerialBlock;
-(void) execSyncInMainQueue;
-(void) execApply;
-(void) execAfter5Second;
@end
