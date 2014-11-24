//
//  AttributeMainViewController.m
//  Ch18_2
//
//  Created by Ho Mark on 12/7/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AttributeMainViewController.h"
#import "AttributeDetailViewController.h"
@interface AttributeMainViewController ()

@end

@implementation AttributeMainViewController
@synthesize currentFilterName;
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
    m_tableData = [[NSMutableArray alloc]init];
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
    return m_tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  // 取得這個濾鏡的屬性字典
  NSDictionary *attributeDict = 
  [CIFilter filterWithName:currentFilterName].attributes;
  // 取得目前屬性的名稱
  NSString* attributeName = [m_tableData objectAtIndex:indexPath.row];
  // 取出該屬性的值
  id attributeValue = [attributeDict objectForKey:attributeName];
  // 如果是一般的儲存格，使用有標題的儲存格
  NSString *CellIdentifier = @"Cell";
  // 如果是字典或陣列，使用沒有副標題的表格儲存格
  if ([attributeValue isKindOfClass:[NSDictionary class]] ||
      [attributeValue isKindOfClass:[NSArray class]]) {
    CellIdentifier = @"NormalCell";
  }
    UITableViewCell *cell = 
  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  // 表格的主標題是這個屬性的名稱 
  cell.textLabel.text = attributeName;
  
  if ([attributeValue isKindOfClass:[NSString class]]) {
    // 如果是字串的值，就展現在副標題
    cell.detailTextLabel.text = (NSString*) attributeValue;
    // 已列出屬性值不需要再接受點擊事件
    cell.userInteractionEnabled = NO;
  } else if ([attributeValue isKindOfClass:[NSArray class]]) {
    // 如果是陣列就將副屬型態設成有細項
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  } else if ([attributeValue isKindOfClass:[NSDictionary class]]) {
    // 如果是陣列就將副屬型態設成有細項
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // 將目前點選濾鏡的屬性名稱傳入
  [self performSegueWithIdentifier:@"AttributeDetail" 
                            sender:[m_tableData objectAtIndex:indexPath.row]];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"AttributeDetail"]) {
    // 取得AttributeDetailViewController的實例
    AttributeDetailViewController* attributeDetailViewController = 
    (AttributeDetailViewController*)[segue destinationViewController];
    // 設置目前的濾鏡名稱
    attributeDetailViewController.currentFilterName = currentFilterName;
    // 設置目前的屬性名
    attributeDetailViewController.currentAttributeName = (NSString*) sender;
  }
}

-(void) viewWillAppear:(BOOL)animated {
  // 在每次畫面出現時更新內容
  [self reloadData];
}

-(void) reloadData {
  // 移除表格的內容
  [m_tableData removeAllObjects];
  // 依名稱取得濾鏡
  CIFilter* currentFilter = 
  [CIFilter filterWithName:currentFilterName];
  // 將表格資料載入
  [m_tableData addObjectsFromArray:
   [currentFilter.attributes allKeys]];
}

@end
