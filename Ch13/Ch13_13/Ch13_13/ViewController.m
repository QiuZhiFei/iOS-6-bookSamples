//
//  ViewController.m
//  Ch13_13
//
//  Created by Ho Mark on 12/6/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "LoopOperation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self execOperation];
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
-(void) execOperation {
//  NSOperationQueue* queue = [NSOperationQueue mainQueue];
  NSOperationQueue* queue = [[[NSOperationQueue alloc]init]autorelease];
  LoopOperation* firstOperation = [[LoopOperation alloc] initWithPrefix:@"first"];
  LoopOperation* secondOperation = [[LoopOperation alloc] initWithPrefix:@"second"];
  LoopOperation* thirdOperation = [[LoopOperation alloc] initWithPrefix:@"third"];
  LoopOperation* fourthOperation = [[LoopOperation alloc] initWithPrefix:@"fourth"];
  // 加入firstOperation至secondOperation的相依性
  [firstOperation addDependency:secondOperation];
  // 將這些作業元件加入作業佇列
  [queue addOperation:firstOperation];
  [queue addOperation:secondOperation];
  [queue addOperation:thirdOperation];
  [queue addOperation:fourthOperation];
  // 呼叫release
  [firstOperation release];
  [secondOperation release];
  [thirdOperation release];
  [fourthOperation release];
  
}
@end
