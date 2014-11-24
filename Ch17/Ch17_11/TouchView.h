//
//  TouchView.h
//  Ch17_11
//
//  Created by Ho Mark on 12/7/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchView : UIView {
  // 記錄同一次觸控的各個觸控點
  NSMutableArray* array1;
  NSMutableArray* array2;
}
// 使用記憶體的位址作排序
-(NSArray*) sortUITouchSet:(NSSet*) set;
@end
