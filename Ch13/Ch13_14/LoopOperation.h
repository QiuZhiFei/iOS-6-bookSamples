//
//  LoopOperation.h
//  Ch13_13
//
//  Created by Ho Mark on 12/6/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoopOperation : NSOperation {
  // 印出迴圈時的標籤
  NSString* m_prefix;
}
// 自訂的初始化函數
-(id) initWithPrefix:(NSString*) prefix;
@end
