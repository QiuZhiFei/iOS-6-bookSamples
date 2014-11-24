//
//  ViewController.m
//  Ch10_1
//
//  Created by Ho Mark on 12/4/5.
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
-(IBAction) openOtherApp {
  NSString* urlString = @"chapter3://";
  // 使用openURL來打開網頁
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

-(IBAction) openSafari {
  // 設定http的網址
  NSString* urlString = @"http://www.delightpress.com.tw";
  // 使用openURL來打開網頁
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

-(IBAction) openEmail {
  // 設定收件人
  NSString* mailTo = @"mark@agogoapp.com";
  // 設定郵件的主旨
  NSString* mailSubject = @"iOS_programming_practice";
  // 設定郵件副本
  NSString* mailCc = @"mark@patristar.com";
  // 設定密件副本
  NSString* mailBcc = @"info@patristar.com";
  // 組合成完整的字串
  NSString* urlString = 
  [NSString stringWithFormat:@"mailto:%@?subject=%@&cc=%@&bcc=%@",
   mailTo,
   mailSubject,
   mailCc,
   mailBcc];
  
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

-(IBAction) openDial {
  
  // 取得這個裝置的實例
  UIDevice* myDevice = [UIDevice currentDevice];
  // 判斷這個裝置是否為iphone
  if ([myDevice.model isEqualToString:@"iPhone"]) {
    // 如果是則執行撥號的功能
    // 指定手機的號碼
    NSString* urlString = [NSString stringWithFormat:@"tel:0975081166"];
    // 使用openURL來打開電話應用程式
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
  } else {
    NSString* messageString = 
    [NSString stringWithFormat:@"您的iOS裝置*%@*不支援iPhone的播號功能，請自行聯絡(02)-xxx-yyyy",myDevice.model];
    // 如果不是支援的裝置
    // 生成一個警告訊息的視窗並且顯現
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"不支援電話播號"  
        message:messageString  
        delegate:nil  
        cancelButtonTitle:@"確認"  
        otherButtonTitles:nil];  
    [message show];  
    [message release];  
  }
}
-(IBAction) openSms {
  // 取得這個裝置的實例
  UIDevice* myDevice = [UIDevice currentDevice];
  // 判斷這個裝置是否為iphone
  if ([myDevice.model isEqualToString:@"iPhone"]) {
    // 如果是則執行撥號的功能
    // 指定手機的號碼
    NSString* urlString = [NSString stringWithFormat:@"sms:0975081166"];
    // 使用openURL來打開電話應用程式
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
  } else {
    NSString* messageString = 
    [NSString 
     stringWithFormat:@"您的iOS裝置*%@*不支援iPhone的簡訊傳送功能，請自行聯絡(02)-xxx-yyyy",myDevice.model];
    // 如果不是支援的裝置
    // 生成一個警告訊息的視窗並且顯現
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"不支援簡訊傳送"  
                message:messageString  
                delegate:nil  
                cancelButtonTitle:@"確認"  
                otherButtonTitles:nil];  
    [message show];  
    [message release];  
  }
  
}

-(void) openMap {
  m_locationString.text=@"台北車站";
  //開啟地圖指定傳入的位置
  NSString *urlString = 
  [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@&t=h",m_locationString.text];
  //將URL用%進行編碼
  urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  NSLog(@"用%%編碼後的字串是:*%@*",urlString);
  // 使用openURL來打開地圖應用程式
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]]; 
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  // 按下return消除虛擬鍵盤
  [textField resignFirstResponder];
  return TRUE;
}

-(IBAction) openYouTube {
  // 取得YouTube的影像識別碼並且組成URL
  NSString *urlString = [NSString 
          stringWithFormat:@"http://www.youtube.com/watch?v=ThdYOKnX6uk"];
  // 開啟YouTube的應用程式
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}
-(IBAction) openStore {
  // 取得iTunes Store
  NSString *urlString = [NSString 
                         stringWithFormat:@"http://itunes.apple.com/tw/app/ibooks/id364709193?mt=8&uo=4"];
  // 開啟iTunes Store
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}
@end
