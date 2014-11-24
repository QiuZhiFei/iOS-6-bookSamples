//
//  main.m
//  Ch4_16
//
//  Created by Ho Mark on 12/3/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    
    // 創建一個NSIndexSet並且設定初始值
    NSMutableIndexSet* myIndexSet = [[NSMutableIndexSet alloc] init];
    [myIndexSet addIndexesInRange:NSMakeRange(0, 1)];
    [myIndexSet addIndexesInRange:NSMakeRange(2, 2)];
    [myIndexSet addIndexesInRange:NSMakeRange(5, 4)];
    [myIndexSet addIndexesInRange:NSMakeRange(12, 2)];
    [myIndexSet addIndexesInRange:NSMakeRange(15, 5)];
    
    // 開始迭代索引
    NSUInteger index=[myIndexSet firstIndex];
    // 只要還沒有超過邊界值
    while(index != NSNotFound)
    {
      NSLog(@"有被選取的索引 %ld",index);
      // 依序遞增索引值
      index=[myIndexSet indexGreaterThanIndex: index];
    }
    
    // 使用removeIndex任意取消索引
    [myIndexSet removeIndex:17];
    // 從最後的索引開始
    NSUInteger index2=[myIndexSet lastIndex];
    // 只要還沒有超過邊界值
    while(index2 != NSNotFound)
    {
      NSLog(@"倒選的結果 %ld",index2);
      // 依序遞減索引值
      index2=[myIndexSet indexLessThanIndex: index2];
    }   

    
  }
  return 0;
}

