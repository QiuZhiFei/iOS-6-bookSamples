//
//  main.m
//  Ch14_13
//
//  Created by Ho Mark on 12/6/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    // 建立學生成績
    NSNumber* stu1 = [NSNumber numberWithInt:45];
    NSNumber* stu2 = [NSNumber numberWithInt:55];
    NSNumber* stu3 = [NSNumber numberWithInt:75];
    NSNumber* stu4 = [NSNumber numberWithInt:65];
    NSNumber* stu5 = [NSNumber numberWithInt:30];
    NSNumber* stu6 = [NSNumber numberWithInt:80];
    NSNumber* stu7 = [NSNumber numberWithInt:95];
    NSNumber* stu8 = [NSNumber numberWithInt:35];
    NSNumber* stu9 = [NSNumber numberWithInt:100];
    NSNumber* stu10 = [NSNumber numberWithInt:40];
    // 將學生成績革馬手人NSMutableArray之中
    NSMutableArray* scores = 
    [NSMutableArray arrayWithObjects:
     stu1, stu2, stu3, stu4, stu5, stu6, stu7, stu8, stu9, stu10, nil];
    // 使用block API建立NSIndexSet
    NSIndexSet* passIndex = 
    [scores indexesOfObjectsPassingTest:
     ^BOOL(id obj, NSUInteger idx, BOOL *stop) {
       NSNumber* currentScore = (NSNumber*) obj;
       if ([currentScore intValue] < 60) {
         return YES;
       }
       return NO;
     }];
    // 套用NSIndexSet，移除indexSet中的內容
    [scores removeObjectsAtIndexes:passIndex];
    // 將結果迭代顯示
    [scores enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      NSNumber* currentScore = (NSNumber*) obj;
      NSLog(@"第%lu個及格學生是%d",idx, [currentScore intValue]);
    }];
    
    
    
  }
  return 0;
}

