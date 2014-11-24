//
//  ViewController.h
//  Ch16_5
//
//  Created by Ho Mark on 12/6/29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CAReplicatorLayer;
@interface ViewController : UIViewController {
  // 新增CAReplicatorLayer的實例
  CAReplicatorLayer *replicatorLayer;

}
// 初始化CAReplicatorLayer
-(void) initCAReplicationLayer;
// 按下Merge進行複本的合併
- (IBAction)doMerge:(id)sender;
// 按下Split進行複本的分散
- (IBAction)doSplit:(id)sender;

@end
