//
//  main.m
//  Ch4_14
//
//  Created by Ho Mark on 12/3/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    // 創建一個NSMutableDictionary
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    // 將資料用setObject:forKey的方式加入
    [dict setObject:@"021234567" forKey:@"海棉保"];
    [dict setObject:@"032345678" forKey:@"派鑫鑫"];
    [dict setObject:@"043456789" forKey:@"謝老板"];
    [dict setObject:@"012345678" forKey:@"章娛哥"];
    [dict setObject:@"021234567" forKey:@"曉蝸"];
    // 傾印鍵值和對應值 (使用objectForKey來取得對應值)
    for (NSString* str1 in dict) {
      NSLog(@"鍵值'%@',對應值是(%@)",str1, [dict objectForKey:str1]);      
    }
    // 刪除NSMutableDictionary中的內容
    [dict removeObjectForKey:@"曉蝸"];
    NSLog(@"使用removeObjectForKey移除曉蝸");
    // 傾印鍵值和對應值 (使用objectForKey來取得對應值)
    for (NSString* str1 in dict) {
      NSLog(@"鍵值'%@',對應值是(%@)",str1, [dict objectForKey:str1]);
    }
  }
    return 0;
}

