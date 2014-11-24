//
//  ModBookViewController.h
//  Ch12_1
//
//  Created by Ho Mark on 12/4/28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainTableViewController;
@interface ModBookViewController : UIViewController <UITextFieldDelegate> {
  // 到主表格畫面的參照
  MainTableViewController* parentTableViewController;
  // 輸入書籍名稱的文字區塊欄位
  IBOutlet UITextField *m_bookName;
  // 輸入ISBN的文字區塊欄位
  IBOutlet UITextField *m_bookDetail;
  // 輸入類別的欄位
  IBOutlet UISegmentedControl *m_category;
  // 目前的標題
  NSString* currentTitle;
  // 目前的細節
  NSString* currentDetail;
  // 目前的類別
  int currentCategory;
  // 目前被選取的區塊
  int currentSection;
  // 目前被選取的列
  int currentRow;
}
// 按下按鈕的回應
- (IBAction)doMod:(id)sender;
@property (nonatomic, weak) MainTableViewController* parentTableViewController;
@property (nonatomic, retain) NSString* currentTitle;
@property (nonatomic, retain) NSString* currentDetail;
@property int currentCategory;
@property int currentSection;
@property int currentRow;
@end
