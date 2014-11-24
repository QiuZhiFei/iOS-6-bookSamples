//
//  main.m
//  Ch14_11
//
//  Created by Ho Mark on 12/6/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    // 建立一個NSSet物件存放星期幾的英文
    NSSet* weekday = [NSSet setWithObjects:
    @"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday", nil];
    // 使用block來作enumerate
    [weekday enumerateObjectsUsingBlock:
     ^(id obj, BOOL *stop) {
      NSLog(@"在weekday中的物件有%@",obj);
    }];
      
  }
    return 0;
}

