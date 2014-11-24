//
//  main.m
//  ch2_1
//
//  Created by Ho Mark on 12/3/3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 生成一個 People的實例person1並且初始化它
        People* person1 = [[People alloc]init];
        // 設定person1這個物件的gender = 0 是女生
        [person1 setGender:0];
        // 新增一個 People物件friend1
        People* friend1 = [[People alloc]init];
        //設定friend1的基本屬性
        friend1.gender = 0;
        [friend1 setAge:20];
        person1.friend = friend1;
        [friend1 release];
        // 傾印出person1的age
        NSLog(@"person1 age = %d",[person1 getAge]);
        // person1對friend1所參照的物件有擁有權
        NSLog(@"friend1 age = %d",[person1.friend getAge]);
        // 使用完person1之後將它的計數器減至0
        [person1 release];
        
    }
    return 0;
}

