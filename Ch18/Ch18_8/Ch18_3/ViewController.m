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
    [m_filterLabel release];
    m_filterLabel = nil;
    [m_filterStepper release];
    m_filterStepper = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  
  if (self) {
    // 新增濾鏡的陣列
    m_filterArray = 
    [[NSArray arrayWithObjects:@"CIColorBlendMode",
      @"CIColorBurnBlendMode",@"CIColorDodgeBlendMode",
      @"CIDarkenBlendMode",@"CIDifferenceBlendMode",
      @"CIExclusionBlendMode",@"CIHardLightBlendMode",
      @"CIHueBlendMode",@"CILightenBlendMode",
      @"CILuminosityBlendMode",@"CIMultiplyBlendMode",
      @"CIOverlayBlendMode",@"CISaturationBlendMode",
      @"CIScreenBlendMode",@"CISoftLightBlendMode",
      nil]retain];
  }
  return self;
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
    [m_filterLabel release];
    [m_filterStepper release];
    [super dealloc];
}


- (IBAction)valueChange:(id)sender {
  // 從Bundle中取得檔案的路徑
  NSString* fileString = 
  [[NSBundle mainBundle] pathForResource:@"book_photo" ofType:@"png"];
  // 從路徑建立UIImage物件
  UIImage* uiImageFromFile = 
  [UIImage imageWithContentsOfFile:fileString];
  // 使用newImage作為替換後的UIImage物件
  UIImage* newImage = nil;  
  // 使用UIImage的CGImage物件建立CIImage物件
  CIImage* image = 
  [CIImage imageWithCGImage:uiImageFromFile.CGImage options:nil];
  
  // 從Bundle中取得檔案的路徑
  NSString* bgFileString = 
  [[NSBundle mainBundle] pathForResource:@"bg2" ofType:@"png"];
  // 從路徑建立UIImage物件
  UIImage* uiBgImageFromFile = 
  [UIImage imageWithContentsOfFile:bgFileString];
  // 產生CIImage物件
  CIImage* image2 = 
  [CIImage imageWithCGImage:uiBgImageFromFile.CGImage options:nil];
  // 從stepper中讀取索引抓取字串
  NSString* filterName = 
  [m_filterArray objectAtIndex:m_filterStepper.value];
  // 設定標籤
  m_filterLabel.text = filterName;
  CIFilter* blendFilter = [CIFilter filterWithName:filterName];
  // 設定影像和背景影像
  [blendFilter setValue:image  forKey:@"inputImage"];
  [blendFilter setValue:image2 forKey:@"inputBackgroundImage"];
  CIImage* finalImage = [blendFilter valueForKey:kCIOutputImageKey];
  
  // 取得CIContext物件
  CIContext *context = [CIContext contextWithOptions:nil];
  CGImageRef imageRef = 
  [context createCGImage:finalImage fromRect:finalImage.extent];
  // 組合回UIImage
  newImage = [UIImage imageWithCGImage:imageRef];
  CGImageRelease(imageRef);
  // 將UIImageView中的圖檔更換
  m_imageView.image = newImage;

}

- (void)viewDidLoad
{
  [super viewDidLoad];
	[self valueChange:nil];
}
@end
