//
//  ViewController.m
//  Ch16_1
//
//  Created by Ho Mark on 12/6/24.
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
}

- (void)viewDidUnload
{
  [m_displayButton release];
  m_displayButton = nil;
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)doDisplay:(id)sender {
  // 按下去之後執行串場動畫
  [UIView 
   transitionWithView:self.view 
   duration:5 
   options: UIViewAnimationOptionTransitionCrossDissolve
   animations:^{
     // 在畫面上增加一個標籤
     UILabel* label = [[UILabel alloc]initWithFrame:
                       CGRectMake(10.0, 50.0, 300.0, 100.0)];
     label.text = @"很久很久以前，在一個遙遠的星球...";
     label.numberOfLines = 0;
     [self.view addSubview:label];
     
   } 
   completion:^(BOOL finished) {
     // 完成時移除原本的元件
     [m_displayButton removeFromSuperview];
     
   }];
}

- (void)dealloc {
  [m_displayButton release];
  [super dealloc];
}
@end
