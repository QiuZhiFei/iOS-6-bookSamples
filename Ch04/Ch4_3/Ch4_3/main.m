//
//  main.m
//  Ch4_3
//
//  Created by Ho Mark on 12/3/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    NSArray *station_name = 
    [NSArray arrayWithObjects:@"昆陽站", @"後山埤站", @"永春站",@"市政府站",@"國父紀念館站",@"昆陽站",nil];
 /*   Chap 4.2.3
    // 查詢"昆陽站"所在的陣列位置
    NSUInteger location1 = [station_name indexOfObject:@"昆陽站"];
    // 如果有超過一個同樣物件，會傳回最小的索引
    NSLog(@"昆陽站所在的位置是 %ld",location1);
  */
    // 使用快捷迭代一一取出裡面的值
    for (NSString* stringInArray in station_name) {
      NSLog(@"目前的這個字串是：%@", stringInArray);
    }

    
  }
  return 0;
}

