//
//  LoopOperation.m
//  Ch13_13
//
//  Created by Ho Mark on 12/6/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoopOperation.h"

@implementation LoopOperation

-(id) initWithPrefix: (NSString*) prefix {
  // 自訂的初始化函數
  // 先呼叫父類別的初始化
  self = [super init];
  if (self) {
    // 將成員變數設成參數
    m_prefix = prefix;
  }
  return self;
}

-(void) main {
  // 真正作業元件實作的內容
  for (int i =0;  i< 5; i++) {
    NSLog(@"%@,印出的索引是%d",m_prefix,i);
  }
}

@end
