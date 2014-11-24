//
//  ViewController.m
//  Ch14_1
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
	// Do any additional setup after loading the view, typically from a nib.
  NSLog(@"-4的絕對值是%d",intAbs_f(-4));
//  int (^intAbs_b)(int);
  int (^intAbs_b)(int) =
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

// 函數的實作
int intAbs_f (int value) {
  if (value > 0) {
    return value;
  }
  return -value;
}

@end
