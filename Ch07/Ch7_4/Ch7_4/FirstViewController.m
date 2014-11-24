//
//  FirstViewController.m
//  Ch7_4
//
//  Created by Ho Mark on 12/4/2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "ProgramViewController.h"
#import "CertificateViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // 設定標籤列的標題
    self.title=@"書籍資料";
    // 設定標籤按鈕的圖示
    self.tabBarItem.image = [UIImage imageNamed:@"dp.png"];
  }
  return self;
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
}

-(void) viewWillAppear:(BOOL)animated {
  // 設定標籤按下去時導覽列的標題
  self.tabBarController.title=@"書籍資料總覽";
  // 有標籤列時不需要再產生工具列
  self.navigationController.toolbarHidden = true;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

-(IBAction)programButtonClicked:(id)sender {
  // 初始化一個ProgramViewController的實例
  ProgramViewController* programViewController = 
  [[ProgramViewController alloc]initWithNibName:@"ProgramViewController" bundle:nil];
  // 將它加入導覽列的堆疊之中
  [self.navigationController pushViewController:programViewController animated:YES];
  // 將擁有權釋放
  [programViewController release];
  
}

-(IBAction)certificateButtonClicked:(id)sender {
  // 初始化一個CertificateViewController的實例
  CertificateViewController* certificateViewController = 
  [[CertificateViewController alloc]initWithNibName:@"CertificateViewController" bundle:nil];
  // 顯示工具列
  self.navigationController.toolbarHidden = false;
  // 將它加入導覽列的堆疊之中
  [self.navigationController pushViewController:certificateViewController animated:YES];
  // 將擁有權釋放
  [certificateViewController release];
}

@end
