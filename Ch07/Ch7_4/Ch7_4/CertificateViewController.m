//
//  CertificateViewController.m
//  Ch7_4
//
//  Created by Ho Mark on 12/4/2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CertificateViewController.h"

@interface CertificateViewController ()

@end

@implementation CertificateViewController

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
  self.title=@"專業認証";
  [self customRightBarButton];
  [self customToolBarButton];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) customRightBarButton {
  // 新增一個圓角按鈕
  UIButton* toolButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  // 讓這個元件從(0,0)作原點，並且它的高可以設定一個30的常數
  toolButton.frame = CGRectMake(0, 0, 70, 30);
  // 設定它的標題
  [toolButton setTitle:@"訊息" forState:UIControlStateNormal];
  // 增加按下後的回應函數
  [toolButton addTarget:self 
                 action:@selector(showWarning:) 
       forControlEvents:UIControlEventTouchUpInside];
  // 以剛生成的toolButton作為內容生成一個UIBarButtonItem的物件
  UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] 
                                    initWithCustomView:toolButton];
  // 將右側的按鈕設成這一顆customBarItem
  self.navigationItem.rightBarButtonItem = customBarItem;
  [customBarItem release];
  
}
-(void) showWarning:(id)sender {
  // 生成一個警告訊息的視窗並且顯現
  UIAlertView *message = 
  [[UIAlertView alloc] initWithTitle:@"訊息" 
   message:@"工具列的右側按鈕被按下" 
   delegate:nil 
   cancelButtonTitle:@"確認" 
   otherButtonTitles:nil];  
  [message show];  
  [message release];  
}

-(void) customToolBarButton {
  // 新增一顆樣式為亮色系的i按鈕
  UIButton* toolButton1 = [UIButton 
                           buttonWithType:UIButtonTypeInfoLight];
  toolButton1.frame = CGRectMake(0, 0, 40, 30);
  //設定回應函數
  [toolButton1 addTarget:self 
        action:@selector(button1Clicked:) 
        forControlEvents:UIControlEventTouchUpInside];
  
  UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] 
        initWithCustomView:toolButton1];
  // 新增第二顆樣式為暗色系的i按鈕
  UIButton* toolButton2 = [UIButton 
                           buttonWithType:UIButtonTypeInfoDark];
  toolButton2.frame = CGRectMake(0, 0, 40, 30);
  //設定回應函數是傳送email
  [toolButton2 addTarget:self 
        action:@selector(button2Clicked:) 
        forControlEvents:UIControlEventTouchUpInside];
  
  UIBarButtonItem *barButton2 = [[UIBarButtonItem alloc] 
        initWithCustomView:toolButton2];
  
  // 建立一個NSArray並且將它指定給toolbarItems的成員變數
  self.toolbarItems = [NSArray arrayWithObjects:
                       barButton1,
                       barButton2,
                       nil];
  [barButton1 release];
  [barButton2 release];
  
}

-(void) button1Clicked:(id) sender {
  //跳到上一頁
  [self.navigationController 
   popViewControllerAnimated:YES];
  
}

-(void) button2Clicked:(id) sender {
  //跳到根畫面
  [self.navigationController 
   popToRootViewControllerAnimated:YES];

  
}

@end
