//
//  ViewController.h
//  Ch20_2
//
//  Created by Ho Mark on 12/7/26.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController <MKMapViewDelegate>{
  // 指向地圖元件
  IBOutlet MKMapView *m_mapView;
  // 紀錄原始的地圖顯示區域
  MKMapRect m_originalRect;
  // 顯示載入中的訊息
  IBOutlet UILabel *m_loadingLabel;
  
}
// 設定地圖所在的區域
- (void) locateMap;
// 設置一般的大小
- (IBAction) doNormalSize:(id)sender;
// 設置稍微大的畫面
- (IBAction) doDoubleSize:(id)sender;
// 設置更大的畫面 
- (IBAction) doFourTimeSize:(id)sender;
// 繪製地標
-(void) placeAnnotation;
- (IBAction)doMerge:(id)sender;
// 取得目前的位置
- (IBAction)showLocation:(id)sender;
-(void) placeLayer;

- (IBAction)doForwardGeocoding:(id)sender;


@end
