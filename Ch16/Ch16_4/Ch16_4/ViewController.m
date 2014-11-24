//
//  ViewController.m
//  Ch16_4
//
//  Created by Ho Mark on 12/6/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	[self initCALayer];
  [self initCAShapeLayer];
  [self initCATextLayer];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
  [caLayer release];
  [caShapeLayer release];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// 初如化CALayer
-(void) initCALayer {
  // 建立UIImage物件作為caLayer的內容
  UIImage* image = [UIImage imageNamed:@"book_photo.png"];
  // 取得CALayer的參照
  caLayer = [[CALayer layer] retain];
  // 設定邊界
  caLayer.bounds = CGRectMake(0, 0, 165, 218);
  // 設定圖形的內容
  caLayer.contents = (id)[image CGImage];
  // 設定圖形的位置
  caLayer.position = CGPointMake(90.0f, 100.0f);
  // 將它加進UIView的圖層中
  [self.view.layer addSublayer:caLayer];

}


-(void) initCAShapeLayer {
  // 建立caShapeLayer的實例
  caShapeLayer = [[CAShapeLayer layer] retain];
  // 建立貝氏線
  UIBezierPath* bezierPath = [UIBezierPath bezierPath];
  // 從 (0,100)開始
  [bezierPath moveToPoint:CGPointMake(0.0, 100.0)];
  // 建立一條波浪線到(200,100)
  [bezierPath addCurveToPoint:CGPointMake(200.0, 100.0) 
                controlPoint1:CGPointMake(50.0, 0.0) 
                controlPoint2:CGPointMake(150.0,200)];
  // 直線連結至(200,200)
  [bezierPath addLineToPoint:CGPointMake(200.0, 200.0)];
  // 建立一條波浪線到(0,200)
  [bezierPath addCurveToPoint:CGPointMake(0.0, 200.0) 
                controlPoint1:CGPointMake(150.0, 300.0) 
                controlPoint2:CGPointMake(50.0,100)];
  // 會自動作close和fill
  // 將bezierPath的內容指定給caShapeLayer
  caShapeLayer.path = bezierPath.CGPath;
  // 設定填塗顏色是藍色
  caShapeLayer.fillColor = [UIColor blueColor].CGColor;
  // 設定線寬為3
  caShapeLayer.lineWidth = 3;
  // 加至主畫面的view之中
  [self.view.layer addSublayer:caShapeLayer];
}

-(void) initCATextLayer {
  // 建立CATextLayer的實例
  caTextLayer = [[CATextLayer layer]retain];
  // 設定圖層的邊界
  caTextLayer.bounds = CGRectMake(0, 0, 180, 100);
  // 設定文字內容
  caTextLayer.string = @"銷售中";
  // 設定文字顏色
  caTextLayer.foregroundColor = [[UIColor whiteColor] CGColor];
  // 設置字型, 大小會被忽略會用預設的36
  caTextLayer.font = [UIFont systemFontOfSize:8].fontName;
  // 設定文字區塊的位置
  caTextLayer.position = CGPointMake(120, 180);
  // 將caTextLayer加至caShapeLayer
  [caShapeLayer addSublayer:caTextLayer];


}

- (IBAction)downPress:(id)sender {
  // 修改動畫的交易時間為五秒鐘
  [CATransaction setAnimationDuration:5.0];
  // 直接設定position，往下移動
  caLayer.position = CGPointMake(90.0f, 300.0f);
  // 可見度改成30%
  caLayer.opacity = 0.3;
}

- (IBAction)upPress:(id)sender {
  // 修改動畫的交易時間為五秒鐘
   [CATransaction setAnimationDuration:5.0];
  // 直接設定position，往上移動
  caLayer.position = CGPointMake(90.0f, 100.0f);
  // 可見度改成100%
  caLayer.opacity = 1;
}

- (IBAction)greenPress:(id)sender {
  // 修改動畫的交易時間為六秒鐘
  [CATransaction setAnimationDuration:6.0];
  // 改變填塗顏色是綠色
  caShapeLayer.fillColor = [UIColor greenColor].CGColor;
  // 改變邊框顏色是洋紅色
  caShapeLayer.strokeColor = [UIColor magentaColor].CGColor;
  // 設定邊框線寬是7
  caShapeLayer.lineWidth = 7;
  // 改變能見度是20%
  caShapeLayer.opacity = 0.2;
  // 圖層Y軸偏移值設為25
  caShapeLayer.position = CGPointMake(0.0, 25.00);
}

- (IBAction)redPress:(id)sender {
  // 修改動畫的交易時間為六秒鐘
  [CATransaction setAnimationDuration:6.0];
  // 改變填塗顏色是紅色
  caShapeLayer.fillColor = [UIColor redColor].CGColor;
  // 改變邊框顏色是藍色
  caShapeLayer.strokeColor = [UIColor blueColor].CGColor;
  // 設定邊框線寬是5
  caShapeLayer.lineWidth = 5;
  // 改變能見度是80%
  caShapeLayer.opacity = 0.8;
  // 圖層Y軸偏移值設為-50
  caShapeLayer.position = CGPointMake(0.0, -50.00);
}


- (void)dealloc {
  [super dealloc];
}
- (IBAction)shrinkPress:(id)sender {
  // 修改動畫的交易時間為四秒鐘
  [CATransaction setAnimationDuration:4.0];
  // 設定字型大小為24
  caTextLayer.fontSize = 24;
  // 設定文字顏色為黑色
  caTextLayer.foregroundColor = 
  [UIColor blackColor].CGColor;
}

- (IBAction)enlargePress:(id)sender {
  // 修改動畫的交易時間為四秒鐘
  [CATransaction setAnimationDuration:4.0];
  // 設定字型大小為48
  caTextLayer.fontSize = 48;
  // 設定文字顏色為紅色
  caTextLayer.foregroundColor = 
  [UIColor redColor].CGColor;
}
@end
