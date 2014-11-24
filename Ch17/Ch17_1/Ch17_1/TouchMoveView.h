//
//  TouchMoveView.h
//  Ch17_1
//
//  Created by Ho Mark on 12/7/5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchView.h"

@interface TouchMoveView : TouchView {
  // 觸控開始的點擊點
  CGPoint startLocation;
  // 點擊時產生的CALayer圖層
  CALayer* caLayer;
}
// 產生動畫的CALayer
-(void) generateCALayer;
// 移動self的位置到目的
-(void) moveSelf;
@end
