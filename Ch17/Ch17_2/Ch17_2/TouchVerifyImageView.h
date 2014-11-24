//
//  TouchVerifyImageView.h
//  Ch17_2
//
//  Created by Ho Mark on 12/7/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchVerifyImageView : UIImageView {
  
}
// 觸控發生在區域內
-(void) clickInside;
// 觸控發生在區域外
-(void) clickOutside;

@end
