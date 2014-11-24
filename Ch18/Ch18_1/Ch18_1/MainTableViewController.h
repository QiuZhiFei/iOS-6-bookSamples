//
//  MainTableViewController.h
//  Ch18_1
//
//  Created by Ho Mark on 12/7/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController 
<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
  // 儲存各種媒體來源常數
  NSArray* m_sourceTypeArray;
  // 表格顯示的資料來源
  NSMutableArray* m_tableData;
  // 依照媒體來源，顯示對應的內容
  NSDictionary* m_titleDictionary;
}
// 使用UIImagePickerController檢查可用的來源
-(void) checkSourceTypes;
// 檢視sourType來源的支援的媒體型態
-(NSString*) checkMediaTypes:(int)sourceType;

@end
