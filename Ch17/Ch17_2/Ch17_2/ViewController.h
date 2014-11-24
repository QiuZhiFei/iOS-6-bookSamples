//
//  ViewController.h
//  Ch17_2
//
//  Created by Ho Mark on 12/7/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 連結至storyboard的標籤元件
  IBOutlet UILabel *m_label;
}
// 在區域內的回應
-(void) insideClicked;
// 在區域外的回應
-(void) outsideClicked;
@end
