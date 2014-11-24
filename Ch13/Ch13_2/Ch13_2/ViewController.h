//
//  ViewController.h
//  Ch13_2
//
//  Created by Ho Mark on 12/6/7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  //連結到storyboard中全營幕的Text View
  IBOutlet UITextView *m_textView; 
}
-(void) loadStringFromBundle;
@end
