//
//  ViewController.m
//  Ch10_2
//
//  Created by Ho Mark on 12/4/9.
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

-(IBAction) updateTitleUserDefault {
  NSLog(@"分節控制器的第%d個標籤被選取了",m_storeSelector.selectedSegmentIndex);
  // 取得使用者偏好的實例
  NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
  // 要將整數轉成NSString*字串，可以生成一格式化字串再將它寫入
  [userDefaults setObject:[NSString stringWithFormat:@"%d",
                           m_storeSelector.selectedSegmentIndex] forKey:@"store_location"];
  [userDefaults synchronize];   
}

@end
