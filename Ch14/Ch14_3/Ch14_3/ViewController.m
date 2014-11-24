//
//  ViewController.m
//  Ch14_3
//
//  Created by Ho Mark on 12/6/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// 使用typedef定義block物件的型態
typedef float (^DiscountBlock) (int);

- (void)viewDidLoad
{
  [super viewDidLoad];
  /*
  m_rate = 0.9;
  // 宣告一個DiscountBlock型態的block
  DiscountBlock normalDiscountBlock;
  normalDiscountBlock = ^(int total) {
    // 傳入總價
    // 乘上折扣比例後傳回
    return total*m_rate;
  };
  int totalPrice = 100;
  NSLog(@"總價%d,折扣是%f,售價是%f",
        totalPrice,m_rate,normalDiscountBlock(totalPrice) );
  m_rate = 0.8;
  NSLog(@"總價%d,折扣是%f,售價是%f",
        totalPrice,m_rate,normalDiscountBlock(totalPrice) );
   */
//  [self localVariableBlock];
  [self localVariableBlock2];
  
}
-(void) localVariableBlock {
  // 定義區域變數 rate 並設定初始值為0.9
  float rate = 0.9;
  // 宣告一個DiscountBlock型態的block
  DiscountBlock normalDiscountBlock;
  normalDiscountBlock = ^(int total) {
    // 傳入總價
    // 乘上折扣比例後傳回
    return total*rate;
  };
  int totalPrice = 100;
  NSLog(@"總價%d,折扣是%f,售價是%f",
        totalPrice,rate,normalDiscountBlock(totalPrice) );
  // 修改 rate為0.8
  rate = 0.8;
  NSLog(@"總價%d,折扣是%f,售價是%f",
        totalPrice,rate,normalDiscountBlock(totalPrice) );
}

-(void) localVariableBlock2 {
  // 定義區域變數 rate 並設定初始值為0.9
  float rate = 0.9;
  // 宣告一個DiscountBlock型態的block
  DiscountBlock normalDiscountBlock;
  normalDiscountBlock = ^(int total) {
    // 傳入總價
    // 乘上折扣比例後傳回
    return total*rate;
  };
  int totalPrice = 100;
  NSLog(@"總價%d,折扣是%f,售價是%f",
        totalPrice,rate,normalDiscountBlock(totalPrice) );
  // 修改 rate為0.8
  rate = 0.8;
  // 重新定義一次block
  normalDiscountBlock = ^(int total) {
    // 傳入總價
    // 乘上折扣比例後傳回
    return total*rate;
  };
  NSLog(@"總價%d,折扣是%f,售價是%f",
        totalPrice,rate,normalDiscountBlock(totalPrice) );  
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
