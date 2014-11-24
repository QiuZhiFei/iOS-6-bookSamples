//
//  MainViewController.h
//  Ch6_1
//
//  Created by Ho Mark on 12/3/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

- (IBAction)showInfo:(id)sender;

@end
