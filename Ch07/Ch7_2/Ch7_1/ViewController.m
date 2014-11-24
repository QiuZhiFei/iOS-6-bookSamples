//
//  ViewController.m
//  Ch7_1
//
//  Created by Ho Mark on 12/3/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ViewController_iPhone_land.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  // 讓裝置發出擺置變更的告知
  [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
  // 實作一個告知的回應，當UIDeviceOrientationDidChangeNotification接收到
  // 就執行orientationChanged:這個函數
  [[NSNotificationCenter defaultCenter] 
   addObserver:self
   selector:@selector(orientationChanged:)
   name:UIDeviceOrientationDidChangeNotification
   object:nil];
  // 初始化橫置的ViewController
  // 預設是直立模式，設置m_isLandscape為false
  m_isLandscape = false;
  // 從xib中生成m_landscapeController物件
  m_landscapeController = [[ViewController_iPhone_land alloc]
                           initWithNibName:@"ViewController_iPhone_land" bundle:nil];
  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    // 讓ViewController只能支援垂直模式
    return (UIInterfaceOrientationIsPortrait(interfaceOrientation));
  } else {
    return YES;
  }
}

- (void)orientationChanged:(NSNotification *)notification
{
  // 取得現在的裝置的擺放狀態
  UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
  
  if (UIDeviceOrientationIsLandscape(deviceOrientation) &&
      !m_isLandscape) // 如果是水平的狀態而且也不是在水平的模式
  {
    // 在這個View中用動畫的方式載入水平的ViewController
    [self presentModalViewController:m_landscapeController
                            animated:YES];
    // 並且設定布林值為真
    m_isLandscape = true;
  }
  else if (UIDeviceOrientationIsPortrait(deviceOrientation) &&
           m_isLandscape)  // 如果是在垂直的狀態且不是在垂直的模式
  {
    // 在這個View中用動畫的方式取消水平的ViewController
    [self dismissModalViewControllerAnimated:YES];
    // 並且設定布林值為假
    m_isLandscape = false;
  }
}

@end
