//
//  main.m
//  ch2_2
//
//  Created by Ho Mark on 12/3/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString* helloWorld = @"Hello World!";
        // 讓"Hello World" (沒有驚探號) 跟helloWorld的字串作比對
        BOOL same = [helloWorld isEqualToString:@"Hello World!"];
        // 顯示出比較的結果
        if (same) {
            NSLog(@"%@",@"strings are the same");  
        } else {
            NSLog(@"%@",@"strings are not the same");  
        }
        NSLog(@"Hello, World!");
        
    }
    // 準備一個格式化的字串
    NSString* formatString = @"你所訂購的飲料共%d杯，售價是%d元";
    // 使用格式化的字串將字串生成
    NSString* outputString = [NSString stringWithFormat:formatString,3,60];
    // 傾印出outputString的description到log
    NSLog(@"%@",outputString);
    return 0;
}

