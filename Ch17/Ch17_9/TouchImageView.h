//
//  TouchImageView.h
//  Ch17_3
//
//  Created by Ho Mark on 12/7/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchImageView : UIImageView <UIGestureRecognizerDelegate> {
  //儲存目前的座標
  CGPoint currentLocation;
}

@end
