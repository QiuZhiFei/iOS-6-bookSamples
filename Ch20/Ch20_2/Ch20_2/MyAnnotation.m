//
//  MyAnnotation.m
//  Ch20_2
//
//  Created by Ho Mark on 12/7/27.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
// 覆寫setCoordinate來偵測位置被移動
-(void) setCoordinate:(CLLocationCoordinate2D)pCoordinate {
  // 建立一個CLLocation物件
  CLLocation *location =
  [[[CLLocation alloc] initWithLatitude:pCoordinate.latitude
                              longitude:pCoordinate.longitude] autorelease];
  // 初始化CLGeoCoder
  CLGeocoder *geocoder = [[CLGeocoder alloc] init];
  [geocoder
   reverseGeocodeLocation: location
   completionHandler: ^(NSArray *placemarks, NSError *error) {
     // 如果有查詢到
     if (placemarks && placemarks.count > 0) {
       // 取出PlaceMark
       CLPlacemark *topResult = [placemarks objectAtIndex:0];
       // 建立地址詳細資訊
       NSString* message =
       [NSString stringWithFormat:@"%@",
        topResult.addressDictionary];
       UIAlertView* alertView = [[[UIAlertView alloc]
                                  initWithTitle:topResult.name
                                  message:message delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil]autorelease];
       [alertView show];
     }
     [geocoder release];
   }];
  // 更新位置
  coordinate = pCoordinate;
}


// 自訂初始化函數的實作
-(id) initWithCoordinate:(CLLocationCoordinate2D) pCoordinate
                   Title:(NSString*) pTitle
             AndSubtitle: (NSString*) pSubtitle {
  self = [super init];
  if (self) {
    // 更新成員函數的值
    coordinate = pCoordinate;
    title = pTitle;
    subtitle = pSubtitle;
  }
  return self;
}

@end
