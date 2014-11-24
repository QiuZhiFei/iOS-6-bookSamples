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
     @"http://api.twitter.com/1/statuses/user_timeline.json?screen_name=MengHangHo"];
    // 從url產生Http request物件
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    // 執行同步的Http下載
    NSData* data =
    [NSURLConnection sendSynchronousRequest:request
                          returningResponse:nil
                                      error:nil];
    if (data) {
      // 使用可變的陣列來取得解析JSON後的結果
      NSMutableArray* resultArray =
      [NSJSONSerialization
       JSONObjectWithData:data
       options:NSJSONReadingMutableContainers error:nil];
      // 第一個陣列中的物件是字典物件
      NSDictionary* resultDict = [resultArray objectAtIndex:0];
      // 從字典中取得user的內容
      NSDictionary* userDict = [resultDict objectForKey:@"user"];
      // 將結果傾印出來
      for(NSString* key in userDict) {
        NSLog(@"(%@)=>%@",key,[userDict objectForKey:key]);
      }
    } else {
      NSLog(@"無法讀取");
    }
    
  }
  return 0;
}

