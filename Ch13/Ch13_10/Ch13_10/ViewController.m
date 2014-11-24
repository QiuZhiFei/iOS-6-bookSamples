//
//  ViewController.m
//  Ch13_10
//
//  Created by Ho Mark on 12/6/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self generateSecondThread];
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
-(void) generateSecondThread { 
  //執行主執行緒的內容
  for (int i = 0; i < 5; i++) {
    NSLog(@"主執行緒中的迴圈是%d",i);
   // 將i的值包裝成NSNumber物件
    NSNumber* index = [NSNumber numberWithInt:i];
    // 產生一個執行緒
    // 雖然執行緒在迴圈中，但是不可以存取變數i
    [NSThread 
     detachNewThreadSelector:@selector(doInSecondThread:) 
     toTarget:self 
     withObject:index];
  }
}

-(void) doInSecondThread:(NSNumber*) index {
  for (int i = 0; i < 5; i++) {
    NSLog(@"(%d)新增執行緒第%d次",index.intValue,i);
  }
}

@end
