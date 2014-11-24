//
//  ViewController.m
//  Ch13_3
//
//  Created by Ho Mark on 12/6/7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadImageFromTable];
}

- (void)viewDidUnload
{
    [m_imageView release];
    m_imageView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [m_imageView release];
    [super dealloc];
}

-(void) loadImageFromTable {
  // 取得NSBundle的實例
  NSBundle* bundle = [NSBundle mainBundle];
  if (bundle) { // 如果可以取得
    NSString* fileURLString = 
    [bundle pathForResource:@"sample" ofType:@"png"];
    if (fileURLString) {
      // 取得影像
      UIImage* image = [UIImage
                        imageWithContentsOfFile:fileURLString];
      if (image) {
        // 設定進ImageView
        m_imageView.image = image;
      }
    }
  }
}
@end
