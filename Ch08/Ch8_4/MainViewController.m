//
//  MainViewController.m
//  Ch8_1
//
//  Created by Ho Mark on 12/6/3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

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
  // 依照不同的裝置設置不同的顏色
	if ([UIDevice currentDevice].userInterfaceIdiom == 
      UIUserInterfaceIdiomPhone) {
    self.view.backgroundColor = [UIColor greenColor];
  } else {
    self.view.backgroundColor = [UIColor blueColor];
  }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)storyBoardButtonClicked:(id)sender {
  // 載入secondViewController
  SecondViewController* secondViewController = 
  [self.storyboard instantiateViewControllerWithIdentifier:@"Second"];
  // 將結果顯現在畫面上
  [self presentModalViewController:secondViewController animated:YES];
}

- (IBAction)xibButtonClicked:(id)sender {
  // 使用xib產生ThirViewController的實例
  ThirdViewController* thirdViewController = 
  [[ThirdViewController alloc]initWithNibName:@"ThirdViewController" bundle:nil];
  // 將結果顯現在畫面上
  [self presentModalViewController:thirdViewController animated:YES];
  // 呼叫release
  [thirdViewController release];
 
}
@end
