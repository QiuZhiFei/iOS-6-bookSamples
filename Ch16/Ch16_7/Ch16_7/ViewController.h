//
//  ViewController.h
//  Ch16_7
//
//  Created by Ho Mark on 12/7/3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController : UIViewController {
  // 第一個動畫圖層
  CALayer* m_caLayer1;
  // 第二個動畫圖層
  CALayer* m_caLayer2;
  // 第三個動畫圖層
  CALayer* m_caLayer3;
  // 連結至storyboard中的灰色區塊
  IBOutlet UIView *m_subLayer;
  // 紀錄現在的變換矩陣
  CATransform3D currentTransform;
}
// 初始化動畫圖層
-(void) initCALayer;
-(void) initPerspective;
- (IBAction)doFirstOrder:(id)sender;
- (IBAction)doSecondOrder:(id)sender;
- (IBAction)doThirdOrder:(id)sender;

- (IBAction)doRotateX:(id)sender;
- (IBAction)doRotateY:(id)sender;
- (IBAction)doRotateZ:(id)sender;

@end
