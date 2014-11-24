//
//  TouchView.m
//  Ch17_11
//
//  Created by Ho Mark on 12/7/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    
  }
  return self;
}
- (BOOL) isMultipleTouchEnabled {
  return YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  // 初始化陣列
  array1 = [[NSMutableArray alloc]init];
  array2 = [[NSMutableArray alloc]init];
  // 將NSSet依照記憶體轉成NSArray並分別加入陣列中
  NSArray* array = [self sortUITouchSet:touches];
  CGPoint pt1 = [[array objectAtIndex:0] 
                 locationInView:self];
  CGPoint pt2 = [[array objectAtIndex:0] 
                 locationInView:self];
  [array1 addObject:[NSValue valueWithCGPoint:pt1]];
  [array2 addObject:[NSValue valueWithCGPoint:pt2]];
   
}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  // 將NSSet依照記憶體轉成NSArray並分別加入陣列中
  NSArray* array = [self sortUITouchSet:touches];
  CGPoint pt1 = [[array objectAtIndex:0] locationInView:self];
  CGPoint pt2 = [[array objectAtIndex:0] locationInView:self];
  [array1 addObject:[NSValue valueWithCGPoint:pt1]];
  [array2 addObject:[NSValue valueWithCGPoint:pt2]];
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  // 將NSSet依照記憶體轉成NSArray並分別加入陣列中
  NSArray* array = [self sortUITouchSet:touches];
  CGPoint pt1 = [[array objectAtIndex:0] locationInView:self];
  CGPoint pt2 = [[array objectAtIndex:0] locationInView:self];
  [array1 addObject:[NSValue valueWithCGPoint:pt1]];
  [array2 addObject:[NSValue valueWithCGPoint:pt2]];
  // 將第一個觸控點的事件傾印出來
  NSString* string1 = [NSString stringWithString:@"第一條線是"];
  for (NSValue* value in array1) {
    CGPoint pt1 = value.CGPointValue;
    string1 = [string1 
               stringByAppendingFormat:@"=>(%.1f,%.1f)",pt1.x, pt1.y];
  }
  NSLog(@"%@",string1);
  // 將第二個觸控點的事件傾印出來
  NSString* string2 = [NSString stringWithString:@"第二條線是"];
  for (NSValue* value in array1) {
    CGPoint pt1 = value.CGPointValue;
    string2 = [string2 
               stringByAppendingFormat:@"=>(%.1f,%.1f)",pt1.x, pt1.y];
  }
  NSLog(@"%@",string2);
  // 清空這兩個陣列 
  [array1 removeAllObjects];
  [array2 removeAllObjects];
  [array1 release];
  [array2 release];
}

-(NSArray*) sortUITouchSet:(NSSet*) set {
  // 傳回一個陣列
  // 依照記憶體來排序 
  return [[set allObjects] 
          sortedArrayUsingComparator:
          ^NSComparisonResult(id obj1, id obj2) {
    if (obj1 < obj2) {
      return NSOrderedAscending;
    }else if (obj1 > obj2) {
      return NSOrderedDescending;
    }else {
      return NSOrderedSame;
    }
  }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

