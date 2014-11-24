//
//  ViewController.h
//  Ch16_6
//
//  Created by Ho Mark on 12/7/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // CALayer的成員變數
  CALayer* caLayer;
}
// 作CALayer物件的初始化
-(void) initCALayer;
// 將動畫圖層下移
- (IBAction)downPress:(id)sender;
// 將動畫圖層上移
- (IBAction)upPress:(id)sender;
// 停止向下動畫
- (IBAction)stopDownPress:(id)sender;
// 停止向上動畫
- (IBAction)stopUpPress:(id)sender;
// 下移且右移
- (IBAction)downAndRightPress:(id)sender;
// 上移且左移
- (IBAction)upAndLeftPress:(id)sender;
// 所有動畫暫停
- (IBAction)stopAllPress:(id)sender;
// 閃動五次
- (IBAction)twinkleFiveTimes:(id)sender;
- (IBAction)keepDownAndRightPress:(id)sender;
- (IBAction)doSlide:(id)sender;
- (IBAction)doTwinkleAndSlide:(id)sender;
- (IBAction)doTwinkleThenSlide:(id)sender;
- (IBAction)doSlideThenTwinkle:(id)sender;

@end
