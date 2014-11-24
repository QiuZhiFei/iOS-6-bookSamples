//
//  CameraSetupViewController.h
//  Ch18_1
//
//  Created by Ho Mark on 12/7/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraSetupViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
  // 選取使用的相機
  IBOutlet UISegmentedControl *m_cameraDeviceSegment;
  // 選取影像取得的模式
  IBOutlet UISegmentedControl *m_cameraCaptureModeSegment;
  // 選取使用閃光燈的模式
  IBOutlet UISegmentedControl *m_cameraFlashModeSegment;
  // ImagePickerController的實例
  UIImagePickerController* m_imagePickerController;
}
// 按下執行照相功能
- (IBAction)execCamera:(id)sender;
// 相機的設定
- (void) setupCamera;

@end
