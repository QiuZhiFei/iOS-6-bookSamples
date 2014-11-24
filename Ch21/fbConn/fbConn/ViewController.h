//
//  ViewController.h
//  fbConn
//
//  Created by Ho Mark on 12/7/30.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 連結至登入未成功
  IBOutlet UILabel *m_statusLabel;
}
// 連結至Logout按鈕
- (IBAction)logoutFacebook:(id)sender;
// 連結到Login Facebook按鈕
- (IBAction)connectFacebook:(id)sender;
@end
