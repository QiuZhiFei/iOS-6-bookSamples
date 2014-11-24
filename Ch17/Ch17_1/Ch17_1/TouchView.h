//
//  TouchView.h
//  Ch17_1
//
//  Created by Ho Mark on 12/7/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchView : UIView {
  // 作為這個View的識別
  NSString* m_label;
  // 儲存移動點
  NSMutableArray* m_movePoints;
}

@end
