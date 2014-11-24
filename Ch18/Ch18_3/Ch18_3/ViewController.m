//
//  ViewController.m
//  Ch18_3
//
//  Created by Ho Mark on 12/7/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self swithClicked:nil];
}

- (void)viewDidUnload
{
    [m_imageView release];
    m_imageView = nil;
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

- (void)dealloc {
    [m_imageView release];
    [super dealloc];
}
- (IBAction)swithClicked:(id)sender {
  // 從Bundle中取得檔案的路徑
  NSString* fileString = 
  [[NSBundle mainBundle] pathForResource:@"book_photo" ofType:@"png"];
  // 從路徑建立UIImage物件
  UIImage* uiImageFromFile = 
  [UIImage imageWithContentsOfFile:fileString];
  // 使用newImage作為替換後的UIImage物件
  UIImage* newImage = nil;  
  // 如果有啟動反轉濾鏡就開始進行濾鏡效果
  UISwitch* invertSwitch = (UISwitch*) sender;
  if(invertSwitch.isOn) {
    // 使用UIImage的CGImage物件建立CIImage物件
    CIImage* image = 
    [CIImage imageWithCGImage:uiImageFromFile.CGImage options:nil];
    // 取得CIFilter的實例
    CIFilter* convertFilter = [CIFilter filterWithName:@"CIColorInvert"];
    // 將影像傳入濾鏡
    [convertFilter setValue:image forKey:@"inputImage"];
    // 取得輸出的CIImage
    image = [convertFilter valueForKey:kCIOutputImageKey];
    // 取得CIContext物件
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = 
    [context createCGImage:image fromRect:image.extent];
    // 組合回UIImage
    newImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
  }else {
    newImage = uiImageFromFile;
  }
  // 將UIImageView中的圖檔更換
  m_imageView.image = newImage;
  
}
@end
