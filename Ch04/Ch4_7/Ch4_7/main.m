//
//  main.m
//  Ch4_7
//
//  Created by Ho Mark on 12/3/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    NSLog(@"Stage1");
    // 創建一個 mutable array來動態加入元件
    NSMutableArray *station_name = [NSMutableArray array];
    
    // 依序加入字串元件
    [station_name addObject:@"昆陽站"];
    [station_name addObject:@"後山碑站"];
    [station_name addObject:@"永春站"];
    [station_name addObject:@"市府站"];
    // 使用快速迭代的方式依序取得值
    for (NSString* thisString in station_name) {
      NSLog(@"目前的這個字串是:%@",thisString);
    }    
    
    NSLog(@"Stage2");
    // 在陣列的第一個位置加入「南港展覽館」並且是在最前面
    [station_name insertObject:@"南港展覽館" atIndex:0];    
    NSLog(@"...加入南港展覽館在最前面...");
    for (NSString* thisString in station_name) {
      NSLog(@"目前的這個字串是:%@",thisString);
    }  
    
    NSLog(@"Stage3");
    // 將第五個元素市府站換成市政府站
    [station_name replaceObjectAtIndex:4 withObject:@"市政府站"];
    NSLog(@"...把第五個字串換成市政府站...");
    for (NSString* thisString in station_name) {
      
      NSLog(@"目前的這個字串是:%@",thisString);
    }  
    NSLog(@"Stage4");  
    // 開始移除元件
    NSLog(@"...開始刪除元件..後山埤, 市府和永春站要被移除");
    // 移除後山埤
    [station_name removeObjectAtIndex:2];
    // 移除最後加入的市政府
    [station_name removeLastObject];
    // 移除現在最後的元件永春站
    [station_name removeLastObject];
    for (NSString* thisString in station_name) {        
      NSLog(@"目前的這個字串是:%@",thisString);
    }  
    
  }
  return 0;
}

