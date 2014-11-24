//
//  ViewController.h
//  Ch7_1
//
//  Created by Ho Mark on 12/3/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController_iPhone_land;
@interface ViewController : UIViewController {
  // 增加一個flag來判斷顯示的狀態
  bool m_isLandscape;
  // 使用一個參照來指向水平擺置的ViewController
  ViewController_iPhone_land* m_landscapeController; 
}

@end
