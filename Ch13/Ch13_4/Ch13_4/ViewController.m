//
//  ViewController.m
//  Ch13_4
//
//  Created by Ho Mark on 12/6/7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self getFileFromDocument];
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

-(void) getFileFromDocument {
  // 取得NSFileManager的實例變數
  NSFileManager* fileManager = [NSFileManager defaultManager];
  // 取得該應用程式Documents的路徑
  NSArray* pathArray = 
  [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
  if (pathArray.count >0) {
    // 取出陣列中的第一個元素
    NSURL* documentDirURL = [pathArray objectAtIndex:0];
    // 模擬器底下需要手動將檔案置入
#if (TARGET_IPHONE_SIMULATOR)
    NSLog(@"在模擬器底下的目錄是%@",documentDirURL.path);
#endif  
    // 取得目錄下的檔案
    NSArray *directoryContent =  
    [fileManager contentsOfDirectoryAtPath:documentDirURL.path error:NULL];
    NSLog(@"在Documents下的目錄有%d個檔案",directoryContent.count);
    for (NSString* file in directoryContent) {
      NSLog(@"在Documents下的檔案有:%@",file);
    }
    
  }
}
@end
