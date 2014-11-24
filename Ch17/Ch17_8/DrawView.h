//
//  DrawView.h
//  Ch17_3
//
//  Created by Ho Mark on 12/7/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface DrawView : UIView {
  // 實作CAShapeLayer作動畫的呼叫
  CAShapeLayer* shapeLayer;
}
// 產生CAShapeLayer
-(void) generateCAShapeLayer;
// 產生CAShapeLayer的動畫
-(void) animateCAShapeLayer;
@end
