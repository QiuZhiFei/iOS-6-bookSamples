//
//  ViewController.m
//  Ch8_7
//
//  Created by Ho Mark on 12/6/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // 在10秒之後起動
  // changeViewController:的函數
  [NSTimer scheduledTimerWithTimeInterval:10 
                                   target:self 
                                 selector:@selector(changeViewController:) 
                                 userInfo:nil 
                                  repeats:false];
}

-(void) changeViewController:(NSTimer*)timer {
  // 執行名為ToSecondViewController的Segue
  [self performSegueWithIdentifier:@"ToSecondViewController" 
                            sender:nil];
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
