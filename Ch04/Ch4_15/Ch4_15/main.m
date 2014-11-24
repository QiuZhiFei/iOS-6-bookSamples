//
//  main.m
//  Ch4_15
//
//  Created by Ho Mark on 12/3/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    // 創建一個NSIndexSet並且設定初始值
    NSIndexSet* myIndexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 20)];
    // 檢查某個索引有沒有在IndexSet之中
    if ([myIndexSet containsIndex:5]) {
      NSLog(@"index 5 有在 myIndexSet之中");
      
    }
    
  }
  return 0;
}

