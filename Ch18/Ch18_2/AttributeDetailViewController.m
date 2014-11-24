//
//  AttributeDetailViewController.m
//  Ch18_2
//
//  Created by Ho Mark on 12/7/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AttributeDetailViewController.h"

@interface AttributeDetailViewController ()

@end

@implementation AttributeDetailViewController
@synthesize currentFilterName;
@synthesize currentAttributeName;

-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // 初始化m_tableData 
    m_tableData = [[NSMutableArray alloc]init];
  }
  return self;
}

-(void) reloadData {
  // 移除所有目前內容
  [m_tableData removeAllObjects];
  // 取得目前濾鏡
  CIFilter* filter = [CIFilter filterWithName:currentFilterName];
  // 取得目前屬性
  id attributeDetail = 
  [filter.attributes objectForKey:currentAttributeName];
  // 依照不同屬性設置不同的讀取方式
  if ([attributeDetail isKindOfClass:[NSDictionary class]]) {
    // 字典就將鍵值讀入
    NSDictionary* dictionary = (NSDictionary*) attributeDetail;
    [m_tableData addObjectsFromArray:[dictionary allKeys]];
  } else if ([attributeDetail isKindOfClass:[NSArray class]]) {
    // 陣列就直接讀入
    NSArray* array = (NSArray*) attributeDetail;
    [m_tableData addObjectsFromArray:array];
    
  }
}

-(void) viewWillAppear:(BOOL)animated {
  [self reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section
{
    return m_tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = 
  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  // 設置標籤的內容
  cell.textLabel.text = [m_tableData objectAtIndex:indexPath.row];
  CIFilter* filter = [CIFilter filterWithName:currentFilterName];
  id attributeDetail = 
  [filter.attributes objectForKey:currentAttributeName];
  if ([attributeDetail isKindOfClass:[NSDictionary class]]) {
    // 字典型態的值填入副標題
    NSDictionary* dictionary = (NSDictionary*) attributeDetail;
    cell.detailTextLabel.text = 
    [[dictionary 
     objectForKey:[m_tableData objectAtIndex:indexPath.row]] description];
    
  } else if ([attributeDetail isKindOfClass:[NSArray class]]) {
    cell.detailTextLabel.text = @"";
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
