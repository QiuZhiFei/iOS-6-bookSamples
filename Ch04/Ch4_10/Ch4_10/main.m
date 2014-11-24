//
//  main.m
//  Ch4_10
//
//  Created by Ho Mark on 12/3/14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    // 使用setWithObjects來創建一個Set
    NSSet* station_name = [NSSet setWithObjects:@"南港站",@"昆陽站",@"後山埤站",@"後山埤站",
                           @"後山埤站",@"永春站",@"市政府站",@"南港站", nil];
    
    // 使用一個陣列將Set的內容取出來
    NSArray *station_name_array = [station_name allObjects];
    // 使用快捷迭代的方式取得值，請注意順序不一定和加入的順序相同
    for (NSString* thisString in station_name_array) {
      NSLog(@"存入陣列中的內容是:%@", thisString);
    }
  }
    return 0;
}

