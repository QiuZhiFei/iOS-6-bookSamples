//
//  MainTableViewController.m
//  Ch18_2
//
//  Created by Ho Mark on 12/7/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainTableViewController.h"
#import "AttributeMainViewController.h"
@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // 初始化m_tableData
    m_tableData = [[NSMutableArray alloc] init];
    // 取得內建的濾鏡名稱
    NSArray* builtInFilterName = 
    [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    // 將濾鏡名稱加入表格的資料來源
    // m_tableData之中
    [m_tableData addObjectsFromArray:builtInFilterName];
    NSLog(@"個數為%d",[builtInFilterName count]);

  }
  return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // 回傳這個陣列中元件的個數
    return m_tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  // 取得濾鏡的名稱 
  NSString* currentFilterName = 
  [m_tableData objectAtIndex:indexPath.row];
  // 設定表格的標題 
  cell.textLabel.text = currentFilterName;
  // 取得目前的濾鏡
  CIFilter* currentFilter = 
  [CIFilter filterWithName:currentFilterName];
  // 設定表格的副標題為濾鏡英文名稱
  cell.detailTextLabel.text = 
  [currentFilter.attributes objectForKey:@"CIAttributeFilterDisplayName"];
  
    
  return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // 執行AttributeMain的segue
  // 列出點擊這一列的濾鏡所有屬性
  [self 
   performSegueWithIdentifier:@"AttributeMain" 
   sender:[m_tableData objectAtIndex:indexPath.row]];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"AttributeMain"]) {
    // 取得AttributeMainViewController的實例
    AttributeMainViewController* attributeMainViewController = 
    [segue destinationViewController];
   // 客制化設定currentFilterNmae的值
    attributeMainViewController.currentFilterName = (NSString*) sender;
  }
}

@end
