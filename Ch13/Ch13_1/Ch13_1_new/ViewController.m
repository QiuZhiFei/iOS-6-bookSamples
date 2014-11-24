//
//  ViewController.m
//  Ch13_1_new
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
  [self doBundle];
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

-(void) doBundle {
  NSBundle* bundle = [NSBundle mainBundle];
  // 取得這個Bundle現在的位置
  NSLog(@"Bundle的位置是在%@",[bundle bundlePath]);
  if (bundle) {
    NSLog(@"應用程式的識別碼是%@",[bundle bundleIdentifier]);
    // 取得Info.plist物件
    NSDictionary* dict = [bundle infoDictionary];
    // 取得應用程式版本編號
    NSString* version = 
    [dict objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"應用程式的版本是%@",version);
  } else {
    NSLog(@"Bundle不能被創建");
  }

}

@end
