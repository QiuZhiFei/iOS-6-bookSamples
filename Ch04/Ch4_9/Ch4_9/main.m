//
//  main.m
//  Ch4_9
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
    // 使用快捷迭代的方式取得值，請注意順序不一定和加入的順序相同
    for (NSString* thisString in station_name) {
      NSLog(@"在Set中的元件有: %@", thisString);
      
    }
  }
  return 0;
}

