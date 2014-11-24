//
//  ViewController.h
//  Ch16_3
//
//  Created by Ho Mark on 12/6/25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  // 產生影像圖檔的IBOutlet變數
  IBOutlet UIImageView *m_imageView;
}
// 產生IBAction
- (IBAction)doFadeOut:(id)sender;
// 產生IBAction
- (IBAction)doFadeIn:(id)sender;
- (IBAction)doFadeOutAndDown:(id)sender;
- (IBAction)doFadeInThenUp:(id)sender;
- (IBAction)doTwinkle:(id)sender;
- (IBAction)doUp:(id)sender;
- (IBAction)doDown:(id)sender;
- (IBAction)doCAUp:(id)sender;
- (IBAction)doCADown:(id)sender;

@end
