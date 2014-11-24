//
//  main.m
//  Ch14_9
//
//  Created by Ho Mark on 12/6/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    // 產生五個NSNumber物件
    NSNumber* score1 = [NSNumber numberWithInt:50];
    NSNumber* score2 = [NSNumber numberWithInt:55];
    NSNumber* score3 = [NSNumber numberWithInt:65];
    NSNumber* score4 = [NSNumber numberWithInt:50];
    NSNumber* score5 = [NSNumber numberWithInt:70];
    // 將它們裝進scoreArray之中
    NSArray* scoreArray = [NSArray arrayWithObjects:
                           score1,score2,score3, score4, score5, nil];
    /*
    // 使用block進行迭代
    [scoreArray enumerateObjectsUsingBlock:
     ^(id obj, NSUInteger idx, BOOL *stop) {
      NSNumber* currentScore = (NSNumber*) obj;
      NSLog(@"第%lu個學生成續是%d", idx, [currentScore intValue]);
    }];
     */
[scoreArray enumerateObjectsUsingBlock:
 ^(id obj, NSUInteger idx, BOOL *stop) {
   NSNumber* currentScore = (NSNumber*) obj;
   if ([currentScore intValue] >= 60) {
     NSLog(@"第一個及格的學生是第%lu個，他的分數是: %d",
           idx+1,[currentScore intValue]);
     // 設定為stop之後就不會再被執行
     *stop = YES;
   }
 }];
      
  }
    return 0;
}

