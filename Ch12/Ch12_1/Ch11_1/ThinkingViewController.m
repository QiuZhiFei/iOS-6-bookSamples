//
//  ThinkingViewController.m
//  Ch7_4
//
//  Created by Ho Mark on 12/4/2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ThinkingViewController.h"

@interface ThinkingViewController ()

@end

@implementation ThinkingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

-(void) drawScrollView {
  // 新增標題
  UILabel* title = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 240, 150)];
  title.text=@"前進Android Market! Android Market實戰演練";
  // 設定為粗體24級字
  title.font = [UIFont boldSystemFontOfSize:24];
  // 設定為多行
  title.numberOfLines = 0;
  [m_scrollView addSubview:title];
  [title release];
  
  // 新增作者
  UILabel* author = [[UILabel alloc]initWithFrame:CGRectMake(50, 160, 240, 40)];
  author.text=@"何孟翰";
  // 設定標準系統16集字
  author.font = [UIFont systemFontOfSize:16];
  [m_scrollView addSubview:author];
  [author release];
  
  // 新增ISBN
  UILabel* isbn = [[UILabel alloc]initWithFrame:CGRectMake(50, 210, 240, 40)];
  isbn.text=@"978-986-6348-92-1";
  // 設定斜體16體字
  isbn.font = [UIFont italicSystemFontOfSize:16];
  [m_scrollView addSubview:isbn];
  [isbn release];
  
  // 新增圖檔
  UIImage* cover = [UIImage imageNamed:@"fig73.png"];
  // 新增一個UIImageView來繪製cover圖檔
  UIImageView* coverView = [[UIImageView alloc]initWithImage:cover];
  coverView.frame = CGRectMake(50, 250,163,225);
  [m_scrollView addSubview:coverView];
  [coverView release];
  
  // 新增價錢
  UILabel* price = [[UILabel alloc]initWithFrame:CGRectMake(50, 500, 240, 40)];
  price.text=@"NTD 850";
  price.font = [UIFont italicSystemFontOfSize:16];
  // 設定為紅色字型
  price.textColor = [UIColor redColor];
  [m_scrollView addSubview:price];
  [price release];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // 設定內容的大小是320x800
  m_scrollView.contentSize = CGSizeMake(320.0f,800.0f);
  // 增加標題
  self.title = @"前進Android...";
  // 實作捲頁內容
  [self drawScrollView];
  
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


@end
