//
//  People.m
//  ch2_1
//
//  Created by Ho Mark on 12/3/3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "People.h"
@implementation People

@synthesize gender;
@synthesize friend;
@synthesize speed;
- (int) getAge {
	return m_age;
}
- (void) setAge:(int) age {
	m_age = age;
}
- (id) init {
	// 先呼叫父類別的初始化函數，並且確保父類別的成員變數都
	// 有被這個初始化函數作適當的處理
	// 並且將回傳的值指到自己這個物件
	// 以本例，父類別是NSObject, 所以是標準命名init
	self = [super init];
	// 如果有順利傳回，就初始化自身類別的變數值
	if (self) {
		m_age = 1;
	}
	// 將自己回傳
	return self;
}

- (void)dealloc {
    [friend release];
    [super dealloc];
}

- (void) doMove {
    NSLog(@"移動的速度是%d",speed);
}

@end
