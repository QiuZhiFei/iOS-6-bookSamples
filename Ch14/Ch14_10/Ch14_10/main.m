//
//  main.m
//  Ch14_10
//
//  Created by Ho Mark on 12/6/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    // 產生一個bookDict物件內含書名跟ISBN
    // 鍵值用ISBN
    // 指向的物件為書名
    NSDictionary* bookDict = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"《超強圖解》前進 Android Market！Google Android SDK實戰演練 第2版",@"978-986-6072-73-4",
     @"前進 Android Market！Google Android SDK 實戰演練",@"978-986-6348-92-1", nil];
    // 使用block進行迭代
    [bookDict enumerateKeysAndObjectsUsingBlock:
     ^(id key, id obj, BOOL *stop) {
       NSLog(@"書名%@",obj);
       NSLog(@"..13碼ISBN:%@",key);
     }];
    
  }
  return 0;
}

