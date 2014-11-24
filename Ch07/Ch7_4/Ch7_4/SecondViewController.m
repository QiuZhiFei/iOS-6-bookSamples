//
//  SecondViewController.m
//  Ch7_4
//
//  Created by Ho Mark on 12/4/2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    self.title = NSLocalizedString(@"Second", @"Second");
    self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
  [super viewDidLoad];
  // 取得應用程式代理物件的實例
	AppDelegate* appDelegate = (AppDelegate*) [[UIApplication sharedApplication]delegate];
  UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, 200, 40)];
  label.text=appDelegate.currentValue;
  // 設定標籤是白色的
  label.textColor = [UIColor whiteColor];
  // 設定背景是黑色的
  label.backgroundColor = [UIColor blackColor];
  [self.view addSubview:label];
  [label release];
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

-(void) viewWillAppear:(BOOL)animated {
  self.tabBarController.title=@"第二個標籤";
}


@end
