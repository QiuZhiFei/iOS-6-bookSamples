//
//  ViewController.m
//  Ch14_2
//
//  Created by Ho Mark on 12/6/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  // 宣告intAbs_b是一個block物件
  // 這個block會傳回一個int
  // 需要一個int作參數
	int (^intAbs_b)(int);

  // 實作block的內容
  intAbs_b =
  ^(int value) {
    if (value > 0) {
      return value;
    }
    return -value;
  };
  
  NSLog(@"-4的絕對值是%d",intAbs_b(-4));
 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
