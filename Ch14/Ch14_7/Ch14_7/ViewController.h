//
//  ViewController.h
//  Ch14_7
//
//  Created by Ho Mark on 12/6/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 增加成員變數供block存取
  int m_sum;
}

-(void) createBlockAndDebug;
-(void) createBlockWithParamAndDebug;
@end
