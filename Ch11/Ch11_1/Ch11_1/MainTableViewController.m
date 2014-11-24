//
//  MainTableViewController.m
//  Ch11_1
//
//  Created by Ho Mark on 12/4/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainTableViewController.h"
#import "ThinkingViewController.h"
#import "AddBookViewController.h"
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

-(void) customAddToolBarButton {
  // 直接生成一個BarButton的Item
  // 使用系統預設的 +
  // 按下後會執行 addAction的指令
  UIBarButtonItem* toolBarButtonItem = [[UIBarButtonItem alloc] 
      initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTableContent:)];
  // 將這個導覽列附屬工具列
  self.toolbarItems = [NSArray arrayWithObjects: toolBarButtonItem,nil];
  
}

-(void) addTableContent:(id)sender {
  // 從Storyboard中該ViewController取出並實例化
  AddBookViewController* addBookViewController = [self.storyboard 
      instantiateViewControllerWithIdentifier:@"AddBook"];
  // 將自身參照傳入
  addBookViewController.parentTableViewController = self;
  // 加入Navigation Controller之中
  [self.navigationController pushViewController:addBookViewController 
                                       animated:YES];
 
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [super viewDidLoad];
  self.navigationItem.rightBarButtonItem = [self editButtonItem];
  // 新增書目所需要的資料
  NSString *item1 = @"Google Android SDK實戰演練 第2版";
  NSString *item2 = @"Google Android SDK實戰演練";
  NSString *item3 = @"SCWCD 5 猛虎出閘";
  // 建立第一個區塊的資料
  NSMutableArray *section0Array = 
  [[NSMutableArray alloc] initWithObjects:item1, item2,nil];
  // 建立第二個區塊的資料
  NSMutableArray *section1Array = 
  [[NSMutableArray alloc] initWithObjects:item3, nil];
  // 將這兩個區塊加入主陣列
  m_tableData = [[NSMutableArray alloc]initWithObjects:section0Array, section1Array, nil];
  [section0Array release];
  [section1Array release];
  //加入區塊的標題
  NSString* title1=@"程式開發";
  NSString* title2=@"專業認証";
  m_titleData = [[NSMutableArray alloc]initWithObjects:title1, title2, nil];
  // 加入圖示
  NSString *photo1 = @"book1.png";
  NSString *photo2 = @"book2.png";
  NSString *photo3 = @"book3.png";
  // 建立第一個區塊的圖檔
  NSMutableArray *section0PhotoArray = [[NSMutableArray alloc] 
                                        initWithObjects:photo1, photo2,nil];
  // 建立第二個區塊的圖檔
  NSMutableArray *section1PhotoArray = [[NSMutableArray alloc] 
                                        initWithObjects:photo3,nil];
  m_photoFileData = [[NSMutableArray alloc]
                     initWithObjects:section0PhotoArray, section1PhotoArray, nil];
  [section0PhotoArray release];
  [section1PhotoArray release];
  // 加入細節
  NSString *detail1 = @"978-986-6072-73-4";
  NSString *detail2 = @"978-986-6348-92-1";
  NSString *detail3 = @"978-986-6348-32-7";
  //建立第一個區塊細節的陣列
  NSMutableArray *detail0PhotoArray = [[NSMutableArray alloc] initWithObjects:detail1, detail2,nil];
  //建立第二個區塊細節的陣列
  NSMutableArray *detail1PhotoArray = [[NSMutableArray alloc] initWithObjects:detail3,nil];
  m_detailTitleData = [[NSMutableArray alloc]
                       initWithObjects:detail0PhotoArray, detail1PhotoArray, nil];
  [detail0PhotoArray release];
  [detail1PhotoArray release];

  // 設定初始化
  self.navigationController.toolbarHidden = false;
  [self customAddToolBarButton];
  


  
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
  // 傳回成員函數陣列的個數
  return [m_tableData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // 取得第一維陣列的索引，傳回第二維陣列的個數
  return [[m_tableData objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = 
  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  // 設定這個cell的標籤的文字訊息
  // indexPath.section是點選的區塊
  // indexPath.row是點選的列
  cell.textLabel.text = [[m_tableData objectAtIndex:indexPath.section] 
      objectAtIndex:indexPath.row];
  // 用同樣的方式取得項目細節的說明
  cell.detailTextLabel.text=[[m_detailTitleData objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
  // 設定圖示
  cell.imageView.image = [UIImage 
      imageNamed:[[m_photoFileData objectAtIndex:indexPath.section] 
                  objectAtIndex:indexPath.row]];;  
  
  //cell.accessoryType = UITableViewCellAccessoryCheckmark;
  //如果使用accessoryView, 原先的accessoryType會被忽略
  UIImage* cellImage = [UIImage imageNamed:@"table_icon"];
  // 使用UIImage產生一個ImageView
  UIImageView* cellAccessoryView = [[UIImageView alloc]initWithImage:cellImage];
  // 設定這個View的大小和使用者行為
  cellAccessoryView.userInteractionEnabled = YES;
  [cellAccessoryView setFrame:CGRectMake(0, 0, 30, 30)];
  // 設定這個View為cell的accessoryView
  cell.accessoryView = cellAccessoryView;
  [cellAccessoryView release];
  
  cell.editingAccessoryType = 
  UITableViewCellAccessoryCheckmark;
  return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  // 從標題中回應適當的字串
  return [m_titleData objectAtIndex:section];
}
-(void) addBookInCategory:(int) category 
                WithTitle:(NSString*) title AndDetail: (NSString*) detail {
  // 依照類別設定書名
  [[m_tableData objectAtIndex:category] 
   insertObject:title atIndex:0];
  // 依照類別設定細節
  [[m_detailTitleData objectAtIndex:category]
   insertObject:detail atIndex:0];
  // 依照類別設定使用的圖示
  [[m_photoFileData objectAtIndex:category]
   insertObject:@"book_new.png" atIndex:0];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    // 用indexPath.section取得區塊的索引
    // 再使用indexPath.row來刪除該物件
    // 刪除主要的資料
    [[m_tableData objectAtIndex:indexPath.section]removeObjectAtIndex:indexPath.row];
    // 刪除細節資料
    [[m_detailTitleData objectAtIndex:indexPath.section]removeObjectAtIndex:indexPath.row];
    // 刪除圖片資料
    [[m_photoFileData objectAtIndex:indexPath.section]removeObjectAtIndex:indexPath.row];    
    
    /*
     // 沒有reloadData的話是不會更新使用者介面的
     [tableView reloadData];
     */
    // 不使用reloadData來強迫表格重新讀取data source，而是
    // 直接操作這個表格並且更新它的內容
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    NSLog(@"第%d個區塊的第%d筆資料被刪除了",indexPath.section,indexPath.row);
    
  }   
  else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }   
}


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
  NSLog(@"被壓下去的是第%d個區塊的第%d筆資料",indexPath.section, indexPath.row);
  if(indexPath.section == 0) {
    if(indexPath.row == 1) {
      // 從Storyboard中該ViewController取出並實例化
      ThinkingViewController* firstBookViewController = [self.storyboard 
            instantiateViewControllerWithIdentifier:@"android1st"];
      // 加入Navigation Controller之中
      [self.navigationController pushViewController:firstBookViewController 
                                           animated:YES];
      
    }
    
  }
}

@end
