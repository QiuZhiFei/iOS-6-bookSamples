//
//  MainTableViewController.h
//  Ch11_1
//
//  Created by Ho Mark on 12/4/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController {
  // 使用一個陣列作為表格的資料來源
  NSMutableArray* m_tableData;
  // 使用一個陣列作為標題的資料來源
  NSMutableArray* m_titleData;
  // 存放圖示的檔名
  NSMutableArray* m_photoFileData;
  // 存放項目的細節
  NSMutableArray* m_detailTitleData;
}
/* 增加工具列的按鈕*/
-(void) customAddToolBarButton;
/*按下之後的回應*/
-(void) addTableContent:(id)sender;
-(void) addBookInCategory:(int) category 
        WithTitle:(NSString*) title AndDetail: (NSString*) detail;
@end
