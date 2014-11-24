//
//  People.h
//  ch2_1
//
//  Created by Ho Mark on 12/3/3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movement.h"
#import "AlarmDelegateA.h"
@interface People : NSObject <Movement, AlarmDelegateA> {
    int m_age; //紀錄年齡
    int gender; // 紀錄性別 0=女 1=男
    People* friend; //讓People可以指向另一個People
    int speed; //紀錄目前的速度
}
- (int) getAge;
- (void) setAge:(int) age;

@property int gender;
@property int speed;
@property (retain) People* friend;  // 不加任何的屬性，預設是assign
@end
