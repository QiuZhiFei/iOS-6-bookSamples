//
//  AttributeMainViewController.h
//  Ch18_2
//
//  Created by Ho Mark on 12/7/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttributeMainViewController : UITableViewController {
  //指定目前的濾鏡
  NSString* currentFilterName;
  NSMutableArray* m_tableData;
}

@property (nonatomic, retain) NSString* currentFilterName;
// 重新建立表格內容
-(void) reloadData;

@end
