//
//  ViewController.h
//  Ch10_2
//
//  Created by Ho Mark on 12/4/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  //連結到xib中的分節控制器
  IBOutlet UISegmentedControl* m_storeSelector;
}
// 當使用者用分節控制器改變值時呼叫這個函數
-(IBAction) updateTitleUserDefault;
@end
