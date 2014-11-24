//
//  SecondViewController.h
//  Ch8_5
//
//  Created by Ho Mark on 12/6/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController {
  // 連結至"第二個畫面"的這個標籤
  IBOutlet UILabel *m_label;
  NSString* parameterString;
}
- (IBAction)doButtonClick:(id)sender;
@property (nonatomic, retain) NSString* parameterString;
@end
