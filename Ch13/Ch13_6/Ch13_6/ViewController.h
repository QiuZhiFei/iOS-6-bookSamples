//
//  ViewController.h
//  Ch13_6
//
//  Created by Ho Mark on 12/6/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  
  IBOutlet UILabel *m_label;
}


-(void) fireATimer;
-(void) doAfterFiveSecond:(NSTimer*) timer;

@end
