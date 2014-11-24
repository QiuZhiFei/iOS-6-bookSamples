//
//  main.m
//  Ch4_6
//
//  Created by Ho Mark on 12/3/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    NSMutableArray *station_name = [NSMutableArray array];
    
    // 依序加入字串元件
    [station_name addObject:@"昆陽站"];
    [station_name addObject:@"後山碑站"];
    [station_name addObject:@"永春站"];
    [station_name addObject:@"市府站"];
    [station_name addObject:@"國父紀念館站"];
    
    // 依照鍵值查詢，鍵值是從0開始
    NSString* secondStationString = [station_name objectAtIndex:1];
    NSLog(@"在station_name陣列中，第二個站名是:%@", secondStationString);
    
    // 查詢"昆陽站"是不是在陣列中
    NSUInteger location1 = [station_name indexOfObject:@"昆陽站"];
    // 傳回的索引值一樣是從0開始
    NSLog(@"昆陽站所在的位置是 %ld",location1);
    
    // 使用快速迭代的方式依序取得值
    for (NSString* thisString in station_name) {
      NSLog(@"目前的這個字串是:%@",thisString);
    }

      
  }
    return 0;
}

