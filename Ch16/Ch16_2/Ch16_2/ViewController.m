//
//  ViewController.m
//  Ch16_2
//
//  Created by Ho Mark on 12/6/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CustomLabelView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // 初始化陣列
  [self initContent];
  // 初始化目前頁面
	currentView = 
  [[CustomLabelView alloc]initWithFrame:CGRectMake(0, 0, 320, 240)];
  // 將目前頁面加至畫面中
  [self.view addSubview:currentView];
  [currentView release];
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

- (IBAction)doNext:(id)sender {
  // 創建下一個畫面
  CustomLabelView* nextView = 
  [[CustomLabelView alloc]
   initWithFrame:CGRectMake(0, 0, 320, 240)];
  // 設定下一頁的文字內容
  [nextView setDisplayText:
   [sentensesArray objectAtIndex:currentPage]];
  // 執行動畫效果
  [UIView 
   transitionFromView:currentView 
   toView:nextView 
   duration:2 
   options:UIViewAnimationOptionTransitionCurlUp
   completion:^(BOOL finished) {
     // 動畫翻頁完成後
     // 將新的頁面設成目前的頁面
     currentView = nextView;
     // 增加頁碼
     currentPage++;
     // 如果翻到最後一頁就回到第一頁
     if (currentPage >=[sentensesArray count]) {
       currentPage = 0;
     }
   }];

}

- (void) initContent {
  //初始化字串的陣列
  sentensesArray = [[NSArray alloc]
                    initWithObjects:@"在很久很久以前...", 
                    @"有一顆藍色的星球...",
                    @"這個星球裡有一個企業...",
                    @"它們的商標是一顆蘋果...",
                    @"它們什麼都作，什麼都大賣，什麼都不奇怪...",
                    @"待續...",nil];
  // 設定目前的頁面
  currentPage = 0;
}
@end
