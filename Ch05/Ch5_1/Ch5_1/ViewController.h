//
//  ViewController.h
//  Ch5_1
//
//  Created by Ho Mark on 12/3/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  IBOutlet UILabel* m_firstLabel;


  IBOutlet UILabel *m_secondLabel;
}

-(IBAction) changeFirstLabelText; // 增加按鈕回應函數
-(IBAction) changeFirstLabelTextAgain;

- (IBAction)generateActionForButton3:(id)sender;

@end
