//
//  main.m
//  Ch21_5
//
//  Created by Ho Mark on 12/7/29.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  @autoreleasepool {
    // 取得使用者的timeline
    NSURL* url =
    [NSURL URLWithString:
     @"http://api.twitter.com/1/followers/ids.json?screen_name=engadget"];
    // 從url產生Http request物件
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    // 執行同步的Http下載
    NSData* data =
    [NSURLConnection sendSynchronousRequest:request
                          returningResponse:nil
                                      error:nil];
    if (data) {
      // 使用可變的字典來取得解析JSON後的結果
      NSMutableDictionary* resultDict =
      [NSJSONSerialization
       JSONObjectWithData:data
       options:NSJSONReadingMutableContainers error:nil];
      // 取得id列表的陣列
      NSArray* idArray = [resultDict objectForKey:@"ids"];
      // 印出個數
      NSLog(@"總共有%lu人",idArray.count);
      // 將結果迭代出來
      [idArray enumerateObjectsUsingBlock:
       ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* idString = (NSString*) obj;
        NSLog(@"第%lu個id是 %@",idx, idString);
         //  印到100人就好，超過的就不印了
        if (idx > 98) { *stop = YES; }
      }];
     
     } else {
      NSLog(@"無法讀取");
    }    
  }
  return 0;
}

