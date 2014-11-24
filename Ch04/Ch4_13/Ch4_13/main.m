//
//  main.m
//  Ch4_13
//
//  Created by Ho Mark on 12/3/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    
    // 使用NSDictionary的dictionaryWithObjectsAndKeys創建一個dictionary
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"021234567",@"海棉保",
                          @"032345678",@"派鑫鑫",
                          @"043456789",@"謝老板",
                          @"012345678",@"章娛哥",
                          @"021234567",@"曉蝸",
                          nil];
    //可以呼叫 keySortedByValueUsingSelector來排序鍵值並傳回到NSArray 
    NSArray *sortedKeysArray =
    [dict keysSortedByValueUsingSelector:@selector(compare:)];
    // Dictionary也可以使用快捷迭代，可以取得鍵值，和插入的次序不相同
    for (NSString* str1 in dict) {
      NSLog(@"取出遞迴的結果是:%@",str1);
      
    }
    NSLog(@"..排序之後..");
    // 鍵值排序之後的結果
    for (NSString* str1 in sortedKeysArray) {
      NSLog(@"排序後的結果是%@",str1);
      
    }
    NSLog(@"取出鍵值和對應值");
    // 傾印鍵值和對應值 (使用objectForKey來取得對應值)
    for (NSString* str1 in dict) {
      NSLog(@"鍵值'%@',對應值是(%@)",str1, [dict objectForKey:str1]);
      
    }
    
  }
  return 0;
}

