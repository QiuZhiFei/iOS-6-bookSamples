//
//  MainViewController.h
//  Ch6_2
//
//  Created by Ho Mark on 12/3/25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
