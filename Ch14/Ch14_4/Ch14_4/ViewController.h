//
//  ViewController.h
//  Ch14_4
//
//  Created by Ho Mark on 12/6/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 作為加總存放的變數
  int m_total; 
}
// 使用m_total成員變數加總的block
-(void) executeBlock;
// 使用區域自動變數加總的block
-(void) executeBlockLocal;
@end
