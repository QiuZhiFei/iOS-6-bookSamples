//
//  ViewController.h
//  Ch5_2
//
//  Created by Ho Mark on 12/3/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
  // 增加一個利用程式生成的文字區塊變數
  UITextField* m_textField2;
  // 新增一個文字標籤, 用來作為密碼區塊的標籤
  UILabel* m_uiLabel;
  // 新增一個按鈕
  UIButton* m_uiButton;
  // 新增一個使用者名稱欄位的程式參照
  IBOutlet UITextField* m_username;

}
-(void) addImageButton;
-(IBAction) clearInput;
@end
