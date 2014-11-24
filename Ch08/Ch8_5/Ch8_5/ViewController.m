//
//  ViewController.m
//  Ch8_5
//
//  Created by Ho Mark on 12/6/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

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

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // 判斷是哪一個Segue
  if ([segue.identifier isEqualToString:@"ToSecondViewController"]) {
    // 取得目的的View Controller
    SecondViewController* secondViewController = 
    (SecondViewController*)[segue destinationViewController];
    // 執行初始化的設定
    secondViewController.parameterString = [[NSDate date] description];
  }
}
@end
