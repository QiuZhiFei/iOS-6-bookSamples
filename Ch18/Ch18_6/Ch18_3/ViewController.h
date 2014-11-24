//
//  ViewController.h
//  Ch18_3
//
//  Created by Ho Mark on 12/7/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 連結至畫面
  IBOutlet UIImageView *m_imageView;
  // 設定強度
  IBOutlet UISlider *m_intensity;
  // 設定半徑
  IBOutlet UISlider *m_radius;
}
- (IBAction)sliderChanged:(id)sender;

@end
