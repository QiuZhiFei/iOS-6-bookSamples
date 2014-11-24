//
//  AlarmDelegateA.h
//  ch2_1
//
//  Created by Ho Mark on 12/3/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlarmDelegateB.h"
@protocol AlarmDelegateA <NSObject>
-(void) doAlarm:(id<AlarmDelegateB>) anotherAlarm;
@end
