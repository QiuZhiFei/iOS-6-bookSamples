//
//  DataViewController.h
//  Ch6_6
//
//  Created by Ho Mark on 12/3/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController {
  IBOutlet UIView* m_pageContent;
}

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end
