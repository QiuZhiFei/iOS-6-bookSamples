//
//  AddBookViewController.m
//  Ch11_1
//
//  Created by Ho Mark on 12/4/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AddBookViewController.h"

@interface AddBookViewController ()

@end

@implementation AddBookViewController
@synthesize parentTableViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [m_bookName release];
    m_bookName = nil;
    [m_bookDetail release];
    m_bookDetail = nil;
    [m_category release];
    m_category = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [m_bookName release];
    [m_bookDetail release];
    [m_category release];
    [super dealloc];
}
- (IBAction)doAdd:(id)sender {
  // 新增一筆資料至父表格視窗
  // 使用這個畫面的輸入項
  // 分別填入書名, ISBN和選取的類別
  [parentTableViewController 
   addBookInCategory:m_category.selectedSegmentIndex
            WithTitle:m_bookName.text
            AndDetail:m_bookDetail.text];
  // 強制MainTableViewController類別能夠讀取內容
  [parentTableViewController.tableView reloadData];
  // 跳回父視窗
  [self.navigationController popViewControllerAnimated: YES];
}
@end
