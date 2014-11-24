//
//  AttributeDetailViewController.h
//  Ch18_2
//
//  Created by Ho Mark on 12/7/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttributeDetailViewController : UITableViewController {
  // 設定選取的濾鏡
  NSString* currentFilterName;
  // 設定選取的屬性
  NSString* currentAttributeName;
  // 表格的資料來源
  NSMutableArray* m_tableData;
}

@property (nonatomic, retain)  NSString* currentFilterName;
@property (nonatomic, retain) NSString* currentAttributeName;

-(void) reloadData;
@end
