//
//  AlarmDelegateB.h
//  ch2_1
//
//  Created by Ho Mark on 12/3/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AlarmDelegateA.h"
@protocol AlarmDelegateA; // 使用forword declaration
@protocol AlarmDelegateB <NSObject>
-(void) doAlarm:(id<AlarmDelegateA>) anotherAlarm;
@end
