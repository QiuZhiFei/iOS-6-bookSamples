//
//  ViewController.m
//  Ch20_2
//
//  Created by Ho Mark on 12/7/26.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"
@interface ViewController ()

@end

@implementation ViewController
-(void) placeAnnotation {
  // 初始化一個地標
  CLLocationCoordinate2D currentLocation =
  CLLocationCoordinate2DMake(25.052198,121.544076);
  // 新增一個地標
  MyAnnotation* annotation =
  [[MyAnnotation alloc]initWithCoordinate:currentLocation
                                    Title:@"南京東路站"
                              AndSubtitle:@"悅知文化總部"];
  //加入地圖中
  [m_mapView addAnnotation:annotation];
  // 將該變數釋放
  [annotation release];
  // 初始化第二個地標
  CLLocationCoordinate2D currentLocation2 =
  CLLocationCoordinate2DMake(25.048115,121.517115);
  // 新增第二個地標
  MyAnnotation* annotation2 =
  [[MyAnnotation alloc]initWithCoordinate:currentLocation2
                                    Title:@"台北車站"
                              AndSubtitle:@"3C賣場"];
  //加入地圖中
  [m_mapView addAnnotation:annotation2];
  // 將該變數釋放
  [annotation2 release];
  // 初始化第三個地標
  CLLocationCoordinate2D currentLocation3 =
  CLLocationCoordinate2DMake(25.050672,121.593279);
  // 新增第三個地標
  MyAnnotation* annotation3 =
  [[MyAnnotation alloc]initWithCoordinate:currentLocation3
                                    Title:@"昆陽站"
                              AndSubtitle:@"南港科技園區"];
  //加入地圖中
  [m_mapView addAnnotation:annotation3];
  // 將該變數釋放
  [annotation3 release];

}
/*
-(void) placeLayer {
  // 初始化一個地標
  // 於台北車站附近
  CLLocationCoordinate2D currentLocation =
  CLLocationCoordinate2DMake(25.048115,121.517115);
  // 繪製一個半徑60的圓
  MKCircle *circle =
  [MKCircle circleWithCenterCoordinate:currentLocation radius:60];
  [m_mapView addOverlay:circle];
}
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id < MKOverlay >)overlay {
  // 取出圓形的overlay並且產生MKCircleView
  MKCircleView* circleView = [[[MKCircleView alloc] initWithOverlay :overlay]autorelease];
  // 設定圓形的填塗顏色線段顏色和線寬
  circleView.lineWidth=4.4f;
  circleView.strokeColor = [UIColor redColor];
  circleView.fillColor = [UIColor blueColor];
  circleView.alpha = 0.5;
  return circleView;
}
 */
 
/*
-(void) placeLayer {
  // 初始化三個位置，分別是南京東路站
  // 台北車站和昆陽站
  CLLocationCoordinate2D currentLocation1 =
  CLLocationCoordinate2DMake(25.052198,121.544076);
  CLLocationCoordinate2D currentLocation2 =
  CLLocationCoordinate2DMake(25.048115,121.517115);
  CLLocationCoordinate2D currentLocation3 =
  CLLocationCoordinate2DMake(25.050672,121.593279);
  // 創建一個陣列包含這三個點
  CLLocationCoordinate2D locations[] =
  {currentLocation1, currentLocation2,currentLocation3};
  // 利用這三個點來建立一線段
  MKPolyline* polyLine = [MKPolyline polylineWithCoordinates:locations count:3];
  [m_mapView addOverlay:polyLine];
   
}
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id < MKOverlay >)overlay {
  // 取出多邊形的overlay並且產生MKPolylineView
  MKPolylineView* polyLineView =
  [[[MKPolylineView alloc]initWithOverlay: overlay]autorelease];
  // 
  polyLineView.strokeColor = [UIColor greenColor];
  polyLineView.alpha = 0.5;
  return polyLineView;
 }
 */

-(void) placeLayer {
  // 初始化南京東站站附近的三個點
  CLLocationCoordinate2D currentLocation1 =
  CLLocationCoordinate2DMake(25.0534,121.5442);
  CLLocationCoordinate2D currentLocation2 =
  CLLocationCoordinate2DMake(25.0533,121.5451);
  CLLocationCoordinate2D currentLocation3 =
  CLLocationCoordinate2DMake(25.0522,121.5441);
  CLLocationCoordinate2D locations[] =
  {currentLocation1, currentLocation2,currentLocation3};
  MKPolygon* polygon = [MKPolygon polygonWithCoordinates:locations count:3];
  [m_mapView addOverlay:polygon];
  
}

- (IBAction)doForwardGeocoding:(id)sender {
  NSString *addressString = @"國父紀念館";
  // 開始正向地理編碼
  CLGeocoder *geocoder = [[CLGeocoder alloc] init];
  [geocoder
   geocodeAddressString:addressString
   completionHandler: ^(NSArray *placemarks, NSError *error) {
     // 如果查詢結果有值
     if (placemarks && placemarks.count > 0) {
       // 找到第一筆資料
       CLPlacemark *topResult = [placemarks objectAtIndex:0];
       // 封裝成MKPlacemark
       MKPlacemark* placemarks =
       [[[MKPlacemark alloc] initWithPlacemark:topResult]
        autorelease];
       // 加到地圖上
       [m_mapView addAnnotation:placemarks];
       // 將地圖移到該點
       [m_mapView setCenterCoordinate:topResult.location.coordinate
                             animated:YES];
      }
     [geocoder release];
   }];
}
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id < MKOverlay >)overlay {
  MKPolygonView* polygonView =
  [[[MKPolygonView alloc]initWithOverlay: overlay] autorelease];

  polygonView.strokeColor = [UIColor greenColor];
  polygonView.lineWidth = 5.0f;
  polygonView.alpha = 0.5;
  polygonView.fillColor = [UIColor yellowColor];
  return polygonView;
}


- (IBAction)doMerge:(id)sender {
  // 取得圖層上所有的地標點
  NSArray* markers = m_mapView.annotations;
  // 先計算出總和
  double long_sum = 0;
  double lat_sum = 0;
  for (id<MKAnnotation> annotation in markers) {
    long_sum += annotation.coordinate.longitude;
      lat_sum+=annotation.coordinate.latitude;
  }
  // 算出平均
  long_sum /= m_mapView.annotations.count;
  lat_sum /= m_mapView.annotations.count;
  // 設定新的座標為算數平均的經緯度
  CLLocationCoordinate2D newLocation =
  CLLocationCoordinate2DMake(lat_sum, long_sum);
  // 分別使用動畫移動這些地標 
  for (id<MKAnnotation> annotation in markers) {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:4.0];
    annotation.coordinate = newLocation;
    [UIView commitAnimations];
  }

}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
  // 讓載入中消失
  m_loadingLabel.alpha = 0;
}
- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
  // 讓載入中顯現
  m_loadingLabel.alpha = 1;
}
- (void)viewDidLoad
{
  [super viewDidLoad];
  // 初始化地圖
	[self locateMap];
  [self placeLayer];
 

  
}


- (IBAction)showLocation:(id)sender {
  if ([CLLocationManager authorizationStatus]==
      kCLAuthorizationStatusDenied) {
    // 如果使用者拒決提供
    // 就顯示警告訊息
    UIAlertView* alertView =
    [[UIAlertView alloc]
     initWithTitle:@"使用者未開放位置"
     message:nil
     delegate:nil
     cancelButtonTitle:@"了解"
     otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
  } else {
    [m_mapView setShowsUserLocation:YES];
  }
}

-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
  // 取得使用者目前的位置
  CLLocationCoordinate2D currentLocation = userLocation.coordinate;
  // 繪製經緯度差各0.005的區域
  MKCoordinateSpan defaultSpan = MKCoordinateSpanMake(0.005, 0.005);
  // 以動畫方式移動至該區域
  [m_mapView setRegion:MKCoordinateRegionMake(currentLocation, defaultSpan) animated:YES];
}

-(void) mapView:(MKMapView*)mapView didFailToLocateUserWithError:(NSError*) error {
  NSLog(@"error ");
}


-(void) locateMap {
  // 初始化一個地理中心
  CLLocationCoordinate2D currentLocation =
  CLLocationCoordinate2DMake(25.052198,121.544076);
  // 將經緯度轉回地圖的點
  MKMapPoint mapPoint = MKMapPointForCoordinate(currentLocation);
  // 將原始的地圖畫面的矩形紀錄下來
  m_originalRect = MKMapRectMake(mapPoint.x , mapPoint.y, 1000,1000);
  // 繪製地圖
  [m_mapView setVisibleMapRect:m_originalRect];
  // 設定地圖的代理物件
  m_mapView.delegate = self;
  // 載入中先不要顯現
  m_loadingLabel.alpha = 0;
}
- (IBAction)doNormalSize:(id)sender {
  UIEdgeInsets insets =
  UIEdgeInsetsMake(0, 0, 0, 0);
  [m_mapView setVisibleMapRect:m_originalRect
                   edgePadding:insets animated:YES];
  [self placeAnnotation];
  
}

- (IBAction)doDoubleSize:(id)sender {
  UIEdgeInsets insets =
  UIEdgeInsetsMake(100, 100, 100, 100);
  [m_mapView setVisibleMapRect:m_originalRect
                   edgePadding:insets animated:YES];
  
}

- (IBAction)doFourTimeSize:(id)sender {
  UIEdgeInsets insets =
  UIEdgeInsetsMake(200, 200, 200, 200);
  [m_mapView setVisibleMapRect:m_originalRect
                   edgePadding:insets animated:YES];
  
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [m_mapView release];
  [m_loadingLabel release];
    [super dealloc];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id < MKAnnotation >)annotation {
  // 試著看看這個marker是不是已經被產生
  MKPinAnnotationView* marker =
  (MKPinAnnotationView*) [mapView
                          dequeueReusableAnnotationViewWithIdentifier:@"default"];
  if (!marker) {
    // 如果沒有產生就產生一個
    marker = [[[MKPinAnnotationView alloc]
              initWithAnnotation:annotation
              reuseIdentifier:@"default"]autorelease];
    // 會從天而下的圖示
    marker.animatesDrop = NO;
    // 客制化圖示是紫色的
    marker.pinColor = MKPinAnnotationColorPurple;
    // 點擊有反應
    marker.canShowCallout = YES;
    // 可以拖拉地標
    marker.draggable = YES;
    if ([annotation.title isEqualToString:@"南京東路站"]) {
      UIButton *callOutButton =
      [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
      [callOutButton
       addTarget:self
       action:@selector(doDetail:)
       forControlEvents:UIControlEventTouchUpInside];
      marker.rightCalloutAccessoryView = callOutButton;
      
    }
  }
  return marker;
}

-(void) doDetail:(id) sender {
  UIAlertView* alertView =
  [[UIAlertView alloc]
    initWithTitle:@"悅知文化"
    message:@"105台北市松山區復興北路99號12樓 "
    delegate:nil
    cancelButtonTitle:@"了解"
    otherButtonTitles:nil, nil];
  [alertView show];
  [alertView release];
}

- (void)mapView:(MKMapView *)mapView
  didAddAnnotationViews:(NSArray *)views {
  // 將每一個 MKPinAnnotationView的元件迭代出來
  for (UIView* view in views) {
    // 最後的畫面是預設的畫面大小
    CGRect endFrame = view.frame;
    // 調整開始動畫畫面的位置
    CGRect startFrame = endFrame;
    startFrame.origin.x = view.frame.origin.x;
    startFrame.origin.y += endFrame.size.height;
    // 設置開始的大小是0
    startFrame.size.width = 0;
    startFrame.size.height = 0;
    // 一開始的透明度為0，且大小是0
    view.frame = startFrame;
    view.alpha = 0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    // 經過三秒後結束的大小是原來的大小
    view.frame = endFrame;
    view.alpha = 1;
    [UIView commitAnimations];
  }

}


@end
