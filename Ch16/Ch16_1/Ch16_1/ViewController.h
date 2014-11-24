//
//  ViewController.h
//  Ch16_1
//
//  Created by Ho Mark on 12/6/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 按鈕元件的IBOutlet變數
  IBOutlet UIButton *m_displayButton;
}

// 按鈕元件按下去的回應
- (IBAction)doDisplay:(id)sender;

@end
