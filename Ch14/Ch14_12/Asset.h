//
//  Asset.h
//  Ch14_12
//
//  Created by Ho Mark on 12/6/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Asset : NSObject {
  // 帳號名稱
  NSString* name;
  // 美金存款
  float usd;
  // 歐元存款
  float euro;
}
// 自訂初始化函數
// 傳入姓名
// 美金和歐元的值
-(id) initWithName:(NSString*) p_name 
            AndUsd:(float) p_usd 
           AndEuro:(float) p_euro;
@property (nonatomic, retain) NSString* name;
@property  float usd;
@property  float euro;
@end
