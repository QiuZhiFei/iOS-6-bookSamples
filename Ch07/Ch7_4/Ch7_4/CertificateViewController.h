//
//  CertificateViewController.h
//  Ch7_4
//
//  Created by Ho Mark on 12/4/2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CertificateViewController : UIViewController {
  
}
-(void) customRightBarButton; // 生成一個按鈕並且作為導覽列右按鈕
-(void) showWarning:(id)sender ; // 按下之後的回應函數
-(void) customToolBarButton; // 在導覽列的工具列新增按鈕
@end
