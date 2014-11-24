//
//  main.m
//  Ch4_12
//
//  Created by Ho Mark on 12/3/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    // 創建一個空的NSMutableSet的物件station_name
    NSCountedSet* station_name = [[NSCountedSet alloc]init];
    // 依序加入原先使用NSSet的站名
    [station_name addObject:@"南港站"];
    [station_name addObject:@"昆陽站"];
    // 確認NSMutableSet一樣可以處理重覆的輸入
    [station_name addObject:@"後山埤站"];
    [station_name addObject:@"後山埤站"];
    [station_name addObject:@"後山埤站"];
    [station_name addObject:@"永春站"];
    [station_name addObject:@"市政府站"];
    [station_name addObject:@"南港站"];
    
    // 快捷迭代秀出結果, 順便使用countForObject來印出次數
    for (NSString* thisString in station_name) {
      NSLog(@"項目'%@'的個數有%ld個", thisString, [station_name countForObject:thisString]);        
    }
  NSLog(@"**移除兩個物件，其中一個不存在**");
  NSLog(@"台北車站在NSCountedSet的個數是：%ld",[station_name countForObject:@"台北車站"]);
  // 不存在的物件移掉也不會有影響
  [station_name removeObject:@"台北車站"];
  // 移除一次後山埤
  NSLog(@"移除一次後山埤");
  [station_name removeObject:@"後山埤站"];
  for (NSString* thisString in station_name) {
    NSLog(@"%@, #%ld", thisString, [station_name countForObject:thisString]);
  }
  NSLog(@"**移除要移光才行**");
  [station_name removeObject:@"後山埤站"];
  [station_name removeObject:@"後山埤站"];
  for (NSString* thisString in station_name) {
    NSLog(@"%@, #%ld", thisString, [station_name countForObject:thisString]);
  }

  }

  return 0;
}

