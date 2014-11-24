//
//  ViewController.h
//  Ch18_3
//
//  Created by Ho Mark on 12/7/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 連結至顯示的圖形介面
  IBOutlet UIImageView *m_imageView;
  // 設置寬度
  IBOutlet UISlider *m_width;
  // 設置銳利度
  IBOutlet UISlider *m_sharpness;
}
// 滑桿移動呼叫的回應函數
- (IBAction)sliderChanged:(id)sender;

@end
