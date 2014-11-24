//
//  ModBookViewController.m
//  Ch12_1
//
//  Created by Ho Mark on 12/4/28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ModBookViewController.h"
#import "MainTableViewController.h"
#import "Book.h"
@interface ModBookViewController ()

@end

@implementation ModBookViewController
@synthesize parentTableViewController;
@synthesize currentTitle;
@synthesize currentDetail;
@synthesize currentCategory;
@synthesize currentRow;
@synthesize currentSection;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // 依照傳入值設定使用者介面的初始值
  m_bookName.text = currentTitle;
  m_bookDetail.text = currentDetail;
  m_category.selectedSegmentIndex = currentCategory;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)doMod:(id)sender {
  // 將資料更新資料庫
  [parentTableViewController 
   modBookWithSection:currentSection
      AndIndex:currentRow 
      InCategory:m_category.selectedSegmentIndex
      WithTitle:m_bookName.text 
      AndDetail:m_bookDetail.text];
  //返回頁面
  [self.navigationController popViewControllerAnimated: YES];  
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}
@end
