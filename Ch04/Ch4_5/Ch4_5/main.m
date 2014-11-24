//
//  main.m
//  Ch4_5
//
//  Created by Ho Mark on 12/3/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    // 宣告一個NSArray, 並且傳入幾個初始物件
    NSArray *station_name = 
    [NSArray arrayWithObjects:@"昆陽站", @"後山埤站", 
     @"永春站",@"市政府站",@"國父紀念館站",@"昆陽站",nil];
    
    // 使用一般的迴圈來迭代NSArray中的物件
    // 使用count的成員變數來取得NSArray的個數
    for (int i = 0 ; i < [station_name count]; i++) {
      NSLog(@"第%d個字串是：%@", i, [station_name objectAtIndex:i]);
    }
  }
  return 0;
}

