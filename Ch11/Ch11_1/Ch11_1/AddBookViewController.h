//
//  AddBookViewController.h
//  Ch11_1
//
//  Created by Ho Mark on 12/4/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
@interface AddBookViewController : UIViewController<UITextFieldDelegate> {
  // 到主表格畫面的參照
  MainTableViewController* parentTableViewController;
  // 輸入書籍名稱的文字區塊欄位
  IBOutlet UITextField *m_bookName;
  // 輸入ISBN的文字區塊欄位
  IBOutlet UITextField *m_bookDetail;
  // 輸入類別的欄位
  IBOutlet UISegmentedControl *m_category;
}

// 按下按鈕的回應
- (IBAction)doAdd:(id)sender;
@property (nonatomic, weak) MainTableViewController* parentTableViewController;
@end
