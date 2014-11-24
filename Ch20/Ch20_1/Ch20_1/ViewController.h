//
//  ViewController.h
//  Ch20_1
//
//  Created by Ho Mark on 12/7/24.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController {
  // 連結至地圖畫面元件的變數
  IBOutlet MKMapView *m_mapView;
  // 三顆按鈕的IBOutlet變數
  IBOutlet UIButton *m_button1;
  IBOutlet UIButton *m_button2;
  IBOutlet UIButton *m_button3;
}
// 設定地圖的位置
-(void) locateMap;
// 按下後前往南京東路站
- (IBAction)clickStation1:(id)sender;
// 按下後前往台北車站
- (IBAction)clickStation2:(id)sender;
// 按下後前往昆陽
- (IBAction)clickStation3:(id)sender;
@end
