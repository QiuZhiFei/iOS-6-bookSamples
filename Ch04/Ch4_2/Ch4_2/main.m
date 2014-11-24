//
//  main.m
//  Ch4_2
//
//  Created by Ho Mark on 12/3/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    // 新增字串物件
    NSString* station1 = @"昆陽站";
    NSString* station2 = @"後山埤站";
    NSString* station3 = @"永春站";
    NSString* station4 = @"市政府站";
    NSString* station5 = @"國父紀念館站";
    // 新增一個NSArray並且將字串加入
    NSArray *station_name = [NSArray arrayWithObjects:station1, station2, station3,station4,station5,nil];
    
    // 依照鍵值查詢，鍵值是從0開始
    NSString* secondStationString = [station_name objectAtIndex:1];
    NSLog(@"在station_name陣列中，第二個站名是:%@", secondStationString);
    
    // 查詢"昆陽站"是不是在陣列中
    NSUInteger location1 = [station_name indexOfObject:@"昆陽站"];
    // 傳回的索引值一樣是從0開始
    NSLog(@"昆陽站所在的位置是 %ld",location1);
    
    // 查詢一個不在陣列中的字串
    NSUInteger location2 = [station_name indexOfObject:@"台北車站"];
    // 查詢不到時傳回的索引值會是2147483647, 對應到NSNotFound這個常數
    if(location2 == NSNotFound) {
      NSLog(@"不在陣列中");
    } else {
      NSLog(@"昆陽站所在的位置是 %ld",location2);
    } 
    
    
    // 超過陣列的邊介會有不可預期的錯誤
    NSString* nonStationString = [station_name objectAtIndex:6];
    NSLog(@"在station_name陣列中，第七個站名是:%@", nonStationString);

    NSLog(@"Hello, World!");
    
    
  }
  return 0;
}


