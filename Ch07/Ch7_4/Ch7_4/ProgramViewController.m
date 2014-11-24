//
//  ProgramViewController.m
//  Ch7_4
//
//  Created by Ho Mark on 12/4/2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ProgramViewController.h"
#import "ThinkingViewController.h"
@interface ProgramViewController ()

@end

@implementation ProgramViewController

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
  self.title=@"程式開發";
  // 在導覽列上的右側加上編輯模式按鈕
  self.navigationItem.rightBarButtonItem = [self editButtonItem];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

-(IBAction)ThinkingButtonClicked:(id)sender {
  // 實例化ThinkingViewController
  ThinkingViewController* thinkingViewController = [[ThinkingViewController alloc]initWithNibName:@"ThinkingViewController" bundle:nil];
  // 將thinkingViewController加入UINavigationController
  [self.navigationController 
   pushViewController:thinkingViewController animated:YES];
  [thinkingViewController release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)setEditing:(BOOL)flag animated:(BOOL)animated {
  // 要先呼叫父類別的函式才能確保正常作用
  [super setEditing:flag animated:animated];
  if (flag == YES) {
    self.title=@"編輯模式";
  } else {
    self.title=@"程式開發";
  }
}
@end
