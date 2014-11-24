//
//  MyAnnotation.h
//  Ch20_2
//
//  Created by Ho Mark on 12/7/27.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotation : NSObject <MKAnnotation> {
  CLLocationCoordinate2D coordinate;
  NSString* title;
  NSString* subtitle;
}
// 自訂初始化的函數
-(id) initWithCoordinate:(CLLocationCoordinate2D) pCoordinate
                   Title:(NSString*) pTitle
             AndSubtitle: (NSString*) pSubtitle;
// 讓協定中這些變數能被存取
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;
@end
