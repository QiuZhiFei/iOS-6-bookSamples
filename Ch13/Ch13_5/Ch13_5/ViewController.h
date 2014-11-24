//
//  ViewController.h
//  Ch13_5
//
//  Created by Ho Mark on 12/6/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 連結到畫面中央的標籤
  IBOutlet UILabel *m_label;
}
-(void) fireATimer;
-(void) doAfterFiveSecond:(NSTimer*) timer;
@end
