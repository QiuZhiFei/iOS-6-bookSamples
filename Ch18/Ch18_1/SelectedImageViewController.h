//
//  SelectedImageViewController.h
//  Ch18_1
//
//  Created by Ho Mark on 12/7/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedImageViewController : UIViewController {
  // 連結到影像的view
  IBOutlet UIImageView* selectedImage;
  // 連結到底下檔名的UILabel
  IBOutlet UILabel* imageLabel;
  // 從外部傳入的檔名
  NSString* label;
  // 從外部傳入的影像
  UIImage* image;
}
@property(nonatomic, retain)NSString* label;
@property(nonatomic, retain)UIImage* image;
@end
