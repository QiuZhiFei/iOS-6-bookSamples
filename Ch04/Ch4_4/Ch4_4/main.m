//
//  main.m
//  Ch4_4
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
    
    // 使用一個int來紀錄索引值 
    int index = 0;
    // 使用快捷迭代一一取出裡面的值
    for (NSString* stringInArray in station_name) {
      NSLog(@"第%d個字串是：%@", index, stringInArray);
      //每次迭代完要記得加1
      index++;
    }   
      
  }
    return 0;
}

