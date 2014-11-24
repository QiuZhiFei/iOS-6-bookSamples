//
//  ViewController.h
//  Ch16_4
//
//  Created by Ho Mark on 12/6/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CAShapeLayer;
@class CATextLayer;
@interface ViewController : UIViewController {
  // 建立CALayer的參照
  CALayer* caLayer;
  // 建立CAShapeLayer的參照
  CAShapeLayer* caShapeLayer;
  // 建立CATextLayer
  CATextLayer* caTextLayer;
}
// 作CALayer物件的初始化
-(void) initCALayer;
// 作CAShapeLayer物件的初始化
-(void) initCAShapeLayer;
// 作CATextLayer物件的初始化
-(void) initCATextLayer;

// down按鈕的回應
- (IBAction)downPress:(id)sender;
// up按鈕的回應
- (IBAction)upPress:(id)sender;
// green按鈕的回應
- (IBAction)greenPress:(id)sender;
// red按鈕的回應
- (IBAction)redPress:(id)sender;
// 縮小的按鈕
- (IBAction)shrinkPress:(id)sender;
// 放大的按鈕
- (IBAction)enlargePress:(id)sender;

@end
