//
//  ViewController.h
//  Ch16_2
//
//  Created by Ho Mark on 12/6/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomLabelView;
@interface ViewController : UIViewController {
  // 字串陣列，放每一頁的內容
  NSArray* sentensesArray;
  // 指向目前畫面的內容
  CustomLabelView* currentView;
  // 目前的頁數
  int currentPage;
}
// 按下按鈕的回應
- (IBAction)doNext:(id)sender;
// 初始化文字資料
- (void) initContent;
@end
