//
//  main.m
//  Ch21_5
//
//  Created by Ho Mark on 12/7/29.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    // 定義一個陣列
    NSArray* weekArray =
    [NSArray arrayWithObjects:@"Sun",@"Mon",@"Tue",@"Wed",@"Thr",@"Fri",@"Sat",nil];
    // 檢視是否為一個合格的JSON物件
    if ([NSJSONSerialization isValidJSONObject:weekArray]) {
      //如果是就將物件轉成JSon的物件
      NSData* data =
      [NSJSONSerialization dataWithJSONObject:weekArray
                                      options:0
                                        error:nil];
      // 用NSString物件取得JSon物件的表示法
      NSString* jSONString =
      [[[NSString alloc]initWithData:data
                            encoding:NSUTF8StringEncoding]autorelease];
      // 將結果傾印出來
      NSLog(@"JSon形式是:%@",jSONString);
    } else {
      NSLog(@"解析錯誤");
    }
  }
  return 0;
}

