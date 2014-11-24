//
//  ViewController.h
//  Ch18_3
//
//  Created by Ho Mark on 12/7/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 連結至畫面
  IBOutlet UIImageView *m_imageView;
  // 連結至濾鏡名稱的標籤
  IBOutlet UILabel *m_filterLabel;
  // 連結至加減按鈕
  IBOutlet UIStepper *m_filterStepper;
  // 存放濾鏡名的陣列
  NSArray* m_filterArray;
  // 反轉開關
  IBOutlet UISwitch *m_reverseSwitch;
}
- (IBAction)valueChange:(id)sender;

@end
