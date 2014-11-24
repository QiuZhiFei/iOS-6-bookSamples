//
//  ViewController.h
//  Ch13_9
//
//  Created by Ho Mark on 12/6/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  
}
// 產生第二個執行緒
-(void) generateSecondThread;
// 在第二個執行緒所產生的內容
-(void) doInSecondThread;

@end
