//
//  DataViewController.m
//  Ch6_6
//
//  Created by Ho Mark on 12/3/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

@synthesize dataLabel = _dataLabel;
@synthesize dataObject = _dataObject;

- (void)dealloc
{
  [_dataLabel release];
  [_dataObject release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
  self.dataLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  self.dataLabel.text = [self.dataObject description];
  // 設定檔名是月份名+jpg的副檔名
  NSString* fileName = [NSString 
                        stringWithFormat:@"%@.jpg",
                        [self.dataObject description]];
  // 新增一個UIImageView
  UIImageView* imageView = [[UIImageView alloc]
                            initWithImage:[UIImage imageNamed:fileName] ];
  // 設定影像的大小
  imageView.frame = CGRectMake(0.0f,0.0f,300.0f,200.0f );
  [m_pageContent addSubview:imageView];
  [imageView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

@end
