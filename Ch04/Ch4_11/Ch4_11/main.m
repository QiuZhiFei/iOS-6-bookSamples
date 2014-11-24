//
//  main.m
//  Ch4_11
//
//  Created by Ho Mark on 12/3/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    // 創建一個空的NSMutableSet的物件station_name
    NSMutableSet* station_name = [[NSMutableSet alloc]init];
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
    // 快捷迭代秀出結果
    for (NSString* thisString in station_name) {
      NSLog(@"%@", thisString);
      
    }
    NSLog(@"**移除兩個物件，其中一個不存在**");
    //就算輸入很多次後山埤，但是移掉就是移掉了
    [station_name removeObject:@"後山埤站"];
    // 不存在的物件移掉也不會有影響
    [station_name removeObject:@"台北車站"];
    for (NSString* thisString in station_name) {
      NSLog(@"%@", thisString);
    }
      
  }
    return 0;
}

