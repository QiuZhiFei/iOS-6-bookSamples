//
//  main.m
//  Ch14_12
//
//  Created by Ho Mark on 12/6/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Asset.h"
// 宣告歐元匯率
const float euroToNtd = 37.7;
// 宣告美金匯率
const float usdToNtd = 29.9;
int main(int argc, const char * argv[])
{

  @autoreleasepool {
    Asset* customer1 = [[[Asset alloc]initWithName:@"Mark" 
                                            AndUsd:100.0 
                                           AndEuro:0.0]autorelease];
    Asset* customer2 = [[[Asset alloc]initWithName:@"John" 
                                            AndUsd:80.0 
                                           AndEuro:20.0]autorelease];
    Asset* customer3 = [[[Asset alloc]initWithName:@"Peter" 
                                            AndUsd:60.0 
                                           AndEuro:40.0]autorelease];
    Asset* customer4 = [[[Asset alloc]initWithName:@"Gary" 
                                            AndUsd:40.0 
                                           AndEuro:60.0]autorelease];
    Asset* customer5 = [[[Asset alloc]initWithName:@"Dean" 
                                            AndUsd:20.0 
                                           AndEuro:80.0]autorelease];
    
    NSMutableArray* customers = [[NSMutableArray alloc]initWithObjects:
      customer5, customer4, customer3, customer2, customer1, nil];
    // 先印出原本的順序
    [customers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      Asset* thisCustomer = (Asset*) obj;
      NSLog( @"第%lu號顧客的姓名:%@,美金%.1f,歐元%.1f",
            idx,thisCustomer.name, thisCustomer.usd, thisCustomer.euro);
         }];
    // 使用block排序
    [customers sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
      // 取得物件
      Asset* leftAsset = (Asset*) obj1;
      Asset* rightAsset = (Asset*) obj2;
      // 計算總額 
      float leftTotal = leftAsset.usd*usdToNtd + leftAsset.euro*euroToNtd;
      float rightTotal = rightAsset.usd*usdToNtd + rightAsset.euro*euroToNtd;
      // 開始比大小
      if (leftTotal < rightTotal) {
        return NSOrderedAscending;
      } else if (rightTotal < leftTotal) {
        return NSOrderedDescending;
      }
     return NSOrderedSame;
    }];
    // 將結果印出來
    [customers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      Asset* thisCustomer = (Asset*) obj;
      NSLog( @"由小到大排序後第%lu號顧客的姓名:%@,美金%.1f,歐元%.1f",
            idx,thisCustomer.name, thisCustomer.usd, thisCustomer.euro);
    }];
    
    [customers release];
      

      
  }
    return 0;
}

