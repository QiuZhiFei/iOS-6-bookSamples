//
//  ViewController.m
//  Ch20_1
//
//  Created by Ho Mark on 12/7/24.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self locateMap];
    m_button1.selected = YES;
}

-(void) locateMap {
  // 初始化一個地理中心
  CLLocationCoordinate2D currentLocation =
  CLLocationCoordinate2DMake(25.052198,121.544076);
  // 初始化地圖擴張的區域
  MKCoordinateSpan currentSpan =
  MKCoordinateSpanMake(0.005, 0.005);
  // 設置地圖的中心
  m_mapView.centerCoordinate = currentLocation;
  // 設置地圖的擴張區域
  m_mapView.region =
  MKCoordinateRegionMake(currentLocation, currentSpan);

  
}

- (IBAction)clickStation1:(id)sender {
  // 初始化一個地理中心至南京東路站
  CLLocationCoordinate2D currentLocation =
  CLLocationCoordinate2DMake(25.052198,121.544076);
  [m_mapView setCenterCoordinate:currentLocation
                        animated:YES];
  // 設定第一個按鈕是選取的狀態
  m_button1.selected = YES;
  m_button2.selected = NO;
  m_button3.selected = NO;  
}

- (IBAction)clickStation2:(id)sender {
  // 初始化一個地理中心至台北車站
  CLLocationCoordinate2D currentLocation =
  CLLocationCoordinate2DMake(25.048115,121.517115);
  [m_mapView setCenterCoordinate:currentLocation
                        animated:YES];
  // 設定第二個按鈕是選取的狀態
  m_button1.selected = NO;
  m_button2.selected = YES;
  m_button3.selected = NO;
}

- (IBAction)clickStation3:(id)sender {
  // 初始化一個地理中心至昆陽站
  CLLocationCoordinate2D currentLocation =
  CLLocationCoordinate2DMake(25.050672,121.593279);
  [m_mapView setCenterCoordinate:currentLocation
                        animated:YES];
  // 設定第三個按鈕是選取的狀態
  m_button1.selected = NO;
  m_button2.selected = NO;
  m_button3.selected = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [m_mapView release];
  [m_button1 release];
  [m_button2 release];
  [m_button3 release];
    [super dealloc];
}


@end
