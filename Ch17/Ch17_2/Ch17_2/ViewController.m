//
//  ViewController.m
//  Ch17_2
//
//  Created by Ho Mark on 12/7/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  //  接收在區域內的觸控告知
  [[NSNotificationCenter defaultCenter] 
   addObserver:self 
   selector:@selector(insideClicked) 
   name:@"clickInside" 
   object:nil ];
  // 接收在區域外的觸控告知
  [[NSNotificationCenter defaultCenter] 
   addObserver:self 
   selector:@selector(outsideClicked) 
   name:@"clickOutside" 
   object:nil ];
}

- (void)viewDidUnload
{
  [m_label release];
  m_label = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void) insideClicked {
  m_label.text = @"觸控在範圍內";

}

-(void) outsideClicked {
  m_label.text = @"觸控在範圍外";
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (void)dealloc {
  [m_label release];
  [super dealloc];
}
@end
