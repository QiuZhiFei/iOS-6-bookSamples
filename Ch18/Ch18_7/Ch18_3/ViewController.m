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



- (void)viewDidUnload
{
    [m_imageView release];
    m_imageView = nil;
    [m_imageView release];
    m_imageView = nil;
    [m_width release];
    m_width = nil;
    [m_sharpness release];
    m_sharpness = nil;
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
    [m_imageView release];
    [m_width release];
    [m_sharpness release];
    [super dealloc];
}
- (IBAction)sliderChanged:(id)sender {
  // 取得CIFilter的實例
  CIFilter* filter = [CIFilter filterWithName:@"CICheckerboardGenerator"];

  // 設置棋盤的第一種顏色
  CIColor* color1 = [CIColor colorWithRed:0.0 green:0.2 blue:1.0];
  // 設置棋盤的第二種顏色
  CIColor* color2 = [CIColor colorWithRed:0.0 green:1.0 blue:0.2];
  // 設置繪製的原點
  CIVector* vector = [CIVector vectorWithX:0.0 Y:0.0];
  // 在濾鏡中設置第一種顏色
  [filter setValue:color1 forKey:@"inputColor1"];
  // 在濾鏡中設置第二種顏色
  [filter setValue:color2 forKey:@"inputColor0"];
  // 設置原點座標
  [filter setValue:vector forKey:@"inputCenter"];
  // 從滑桿取得寬度
  [filter setValue:[NSNumber numberWithFloat:m_width.value*800] 
            forKey:@"inputWidth"];
  // 從滑桿取得銳利度
  [filter setValue:[NSNumber numberWithFloat:m_sharpness.value] 
            forKey:@"inputSharpness"];
  // 取出CIImage的物件
  CIImage* image = [filter valueForKey:kCIOutputImageKey];
  // 取得CIContext物件
  CIContext *context = [CIContext contextWithOptions:nil];
  // 產生具體的CGImageRef
  CGImageRef cgImageRef = 
  [context createCGImage:image 
                fromRect:CGRectMake(0.0, 0.0, m_imageView.bounds.size.width, 
                                    m_imageView.bounds.size.height)];
  // 產生出UIImage
  UIImage* newImage = [UIImage imageWithCGImage:cgImageRef];
  // 釋放記憶體
  CGImageRelease(cgImageRef);
   // 將UIImageView中的圖檔更換
  m_imageView.image = newImage;

}
- (void)viewDidLoad
{
  [super viewDidLoad];
  // 設定初始值
  m_width.value = 0.05;
  m_sharpness.value = 1.0;
  // 呼叫sliderChanged產生圖形
	[self sliderChanged:nil];
}
@end
