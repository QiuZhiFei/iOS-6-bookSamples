//
//  ViewController.m
//  Ch5_2
//
//  Created by Ho Mark on 12/3/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // 新增一個文字編輯區塊，並且設定它所佔的維度和位置
  m_textField2 = [[UITextField alloc]initWithFrame:CGRectMake(34, 150, 219, 31)];
  // 同樣的設定這個文字區塊的回應函數
  m_textField2.delegate = self;
  // 設定placeholder, 文字區塊的提示訊息
  m_textField2.placeholder = @"第二個手動設置的文字區塊";
  // 設定這個文字區塊的邊框效果
  m_textField2.borderStyle = UITextBorderStyleRoundedRect;
  // 將它加到ViewController的最上層的view中來顯示它
  // 設定這個文字區塊的tag屬性
  m_textField2.tag = 2;
  // 設定textField2是密碼屬性
  m_textField2.secureTextEntry = true;
  [self.view addSubview:m_textField2];
  // For manual label
  // 新增一個UILabel物件
  m_uiLabel = [[UILabel alloc]initWithFrame:CGRectMake(34, 120, 150, 24)];
  // 設定文字內容
  m_uiLabel.text=@"使用者密碼";
  // 設定字型
  m_uiLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
  // 設定背景是透明的顏色
  m_uiLabel.backgroundColor = [UIColor clearColor];
  // 設定文字的顏色是紅色的
  m_uiLabel.textColor = [UIColor redColor];
  [self.view addSubview:m_uiLabel];
  // 呼叫程式碼生成的按鈕
  [self addImageButton];
  
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

-(BOOL) textFieldShouldReturn:(UITextField*) textField {
  // 傳入的textField就是被按下enter的文字區塊物件
  // 檢查是不是有文字區塊的輸入
  NSString* fieldName = @"";
  if ([textField.text length]== 0) {
    if (textField.tag == 1) { // 判斷傳入的textField的tag值為1, 由xib生成
      fieldName = @"用xib生成";
      
    } else if (textField.tag == 2) { // 判斷傳入的texfField的tag值為2, 由程式碼生成
      fieldName = @"用程式碼生成";
      
    }
    // 如果字串長度為0, 就提示警告視窗
    // 依照不同傳入的textFiled設定不同的標題
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:fieldName 
                          message:@"文字區塊不可為空"  
                          delegate:nil 
                          cancelButtonTitle:@"我了解了" 
                          otherButtonTitles: nil, nil];
    [alert show];
    [alert release];        
  } else {
    // 只有在使用者有輸入值時才會正確的回傳
    // 傳入的 textField的text屬性會有使用者的輸入字串
    NSLog(@"文字區塊的訊息是%@",textField.text);
    // 呼叫這個物件的resignFirstResponder來
    [textField resignFirstResponder];
    return YES;
    
  }
  return NO;
}
- (void)dealloc
{
  [m_textField2 release];
  [super dealloc];
}

-(void) addImageButton {
  // 創建一個自訂樣式的按鈕
  m_uiButton = [UIButton buttonWithType:UIButtonTypeCustom];
  // 設定這個按鈕的維度
  m_uiButton.frame = CGRectMake(184, 309, 89, 28);
  // 準備按鈕的圖示
  UIImage *normalImage = [UIImage imageNamed:@"submit_normal.png"];
  UIImage *clickImage = [UIImage imageNamed:@"submit_click.png"];
  // 設定正常狀態的圖示
  [m_uiButton setImage:normalImage forState:UIControlStateNormal];
  // 設定選取狀態的圖示
  [m_uiButton setImage:clickImage forState:UIControlStateSelected];
  // 加入並顯現
  // 加入點擊的事件
  [m_uiButton addTarget:self 
        action:@selector(submitEvent:) 
       forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:m_uiButton];
}
-(IBAction) clearInput {
  // 清除使用者代號塊輸入的欄位
  m_username.text = @"";
  // 清除密碼欄位
  m_textField2.text = @"";
}

-(void) submitEvent:(id)sender {
  NSLog(@"使用者代號為%@",m_username.text);
  
  NSLog(@"使用者密碼為%@",m_textField2.text);
}

@end
