//
//  ViewController.h
//  Ch18_3
//
//  Created by Ho Mark on 12/7/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 連結到畫面上UIImageView
  IBOutlet UIImageView *m_imageView;
}
// 當UISwitch的值有變動時被呼叫
- (IBAction)swithClicked:(id)sender;

@end
