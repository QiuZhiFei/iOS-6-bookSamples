//
//  MainViewController.m
//  Ch14_8
//
//  Created by Ho Mark on 12/6/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
  bool isColorChanged = true;
  FlipsideViewController *controller = 
  [[[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil] autorelease];
  controller.delegate = self;
  controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  //[self presentModalViewController:controller animated:YES];
  // 使用有block的版本
  [self presentViewController:controller animated:YES completion:^{
    //會在controller的viewWillAppear之後呼叫
    if (isColorChanged) {
      controller.view.backgroundColor = [UIColor blueColor];
    }
  }];
   
}

@end
