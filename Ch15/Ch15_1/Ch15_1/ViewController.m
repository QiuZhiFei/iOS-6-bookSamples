//
//  ViewController.m
//  Ch15_1
//
//  Created by Ho Mark on 12/6/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//  [self calculateRect];
  [self divideRect];
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
-(void) calculateRect {
  // 產生兩個矩形
  CGRect rect1 = CGRectMake(1.0f, 1.0f, 5.0f, 3.0f);
  CGRect rect2 = CGRectMake(4.0f, 3.0f, 5.0f, 3.0f);
  // 計算交集後的矩形
  CGRect intersectRect = CGRectIntersection(rect1, rect2);
  // 印出矩形的原點的X和Y
  NSLog(@"交集後矩形原點是(%.1f,%.1f)",
        intersectRect.origin.x,intersectRect.origin.y);
  // 印出矩形的寬和高
  NSLog(@"交集後矩形原點是(%.1f,%.1f)",
        intersectRect.size.width, intersectRect.size.height);
  
}
-(void) divideRect {
  // 定義原本的矩形
  CGRect rect = CGRectMake(1.0f, 1.0f, 50.0f, 50.0f);
  // 定義切下的矩形
  CGRect slice = CGRectNull;
  // 定義留下來的矩形
  CGRect reminder = CGRectNull;
  // 進行切割
  CGRectDivide(rect, &slice, &reminder, 10.0f, CGRectMinYEdge);
  // 檢視切割出的矩形
  NSLog(@"切出來的矩形的原點是(%.1f,%.1f)",
        slice.origin.x,slice.origin.y);
  NSLog(@"切出來的矩形的維度是(%.1f,%.1f)",
        slice.size.width,slice.size.height);
  // 檢視留下的矩形
  NSLog(@"留下來的矩形的原點是(%.1f,%.1f)",
        reminder.origin.x,reminder.origin.y);
  NSLog(@"留下來的矩形的維度是(%.1f,%.1f)",
        reminder.size.width,reminder.size.height);
}
@end
