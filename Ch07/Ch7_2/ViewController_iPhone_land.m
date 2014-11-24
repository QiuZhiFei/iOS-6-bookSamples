//
//  ViewController_iPhone_land.m
//  Ch7_2
//
//  Created by Ho Mark on 12/3/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController_iPhone_land.h"

@interface ViewController_iPhone_land ()

@end

@implementation ViewController_iPhone_land

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // 只回應水平橫置的擺置
  return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

@end
