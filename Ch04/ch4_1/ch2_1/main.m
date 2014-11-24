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
        person1.speed = 30;
        if ([person1 conformsToProtocol:@protocol(Movement)]  ) {
            [person1 doMove];
        }
        [person1 release];
        
        // 生成一個實作移動的實例person1並且初始化它
        id<Movement> somethingMoveable = [[People alloc]init];
        if ([somethingMoveable conformsToProtocol:@protocol(Movement)]  ) {
            [somethingMoveable doMove];
        }
        [somethingMoveable release];
        
        
    }
    return 0;
}

