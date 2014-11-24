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
#import "AppDelegate.h" // 為了取得Core Data存取物件
#import "Book.h" // 資料庫互動類別
#import "ModBookViewController.h"
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
  [toolBarButtonItem release];
  
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

/*2*/
-(void) loadData {
  // 如果有資料先清空
  for (NSMutableArray* currentSection in m_books) {
    [currentSection removeAllObjects];
  }
  // 設定從Core Data框架中取出Beverage的Entity
  NSFetchRequest* request = [[NSFetchRequest alloc]init];
  NSEntityDescription *entity = [NSEntityDescription 
                                 entityForName:@"Book" 
                                 inManagedObjectContext:[appDelegate managedObjectContext]];
  [request setEntity:entity];
  NSError* error = nil;
  //執行存取的指令並且將資料載入returnObjs
  NSMutableArray* returnObjs = [[[appDelegate managedObjectContext] 
                                 executeFetchRequest:request error:&error]mutableCopy];
  [request release];
  // 將資料倒入表格的資料來源之中
  for (Book* currentBook in returnObjs) {
    if (currentBook.category.intValue == 0) {
      [[m_books objectAtIndex:0]insertObject:currentBook atIndex:0];
    } else {
      [[m_books objectAtIndex:1]insertObject:currentBook atIndex:0];
    }
    
  }
  [returnObjs release];
  // 將表格的資料重新載入
  [self.tableView reloadData];
  
}
/*3*/

-(void) viewWillAppear:(BOOL) animated {
  [super viewWillAppear:animated];
  [self loadData];
}

/*1*/
- (void)viewDidLoad
{
  [super viewDidLoad];
  [super viewDidLoad];
  self.navigationItem.rightBarButtonItem = [self editButtonItem];
  
  /*準備書籍的陣列*/
  NSMutableArray* section0Array = [[NSMutableArray alloc]init];
  NSMutableArray* section1Array = [[NSMutableArray alloc]init];
  m_books = [[NSMutableArray alloc]
             initWithObjects: section0Array, section1Array, nil];
  [section0Array release];
  [section1Array release];
  
  //加入區塊的標題
  NSString* title1=@"程式開發";
  NSString* title2=@"專業認証";
  m_titleData = [[NSMutableArray alloc]
                 initWithObjects:title1, title2, nil];
  // 設定初始化
  self.navigationController.toolbarHidden = false;
  [self customAddToolBarButton];
  
  // 取得應用程式的代理物件參照
  appDelegate = (AppDelegate*)
  [[UIApplication sharedApplication]delegate];
  
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
/*4*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // 傳回成員函數陣列的個數
  return [m_books count];
}
/*5*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // 取得第一維陣列的索引，傳回第二維陣列的個數
  return [[m_books objectAtIndex:section] count];
}
/*6*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = 
  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  // 取得目前的這筆資料的被管理物件
  Book* currentBook = [[m_books objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
  // 設定這個cell的標籤的文字訊息
  // indexPath.section是點選的區塊
  // indexPath.row是點選的列
  cell.textLabel.text = currentBook.title;
  // 用同樣的方式取得項目細節的說明
  cell.detailTextLabel.text=currentBook.detail;
  // 設定圖示
  cell.imageView.image = [UIImage 
      imageNamed:currentBook.book_photo];  
  
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
                WithTitle:(NSString*) title 
                AndDetail: (NSString*) detail {
  NSLog(@"新增資料庫管理物件準備寫入");
  // 新增一個飲料的entity
  // 並且準備存在AppDelegate的managedObjectContext中
  Book *book = (Book*)[NSEntityDescription 
    insertNewObjectForEntityForName:@"Book" 
             inManagedObjectContext:[appDelegate managedObjectContext]];
  // 從參數設定物件初始值
  book.title = title;
  book.detail = detail;
  book.category = [NSNumber numberWithInt:category];
  book.book_photo = @"book_new.png";
  // 準備將Entity存進Core Data
  NSError* error = nil;
  if (![appDelegate.m_managedObjectContext save:&error]) {
    NSLog(@"新增書籍遇到錯誤");
  }
  
  
}

-(void) modBookWithSection:(int) section
                  AndIndex:(int) index
                InCategory:(int) category 
                 WithTitle:(NSString*) title 
                 AndDetail: (NSString*) detail {
  // 取得該物件的實例
  Book* alteredBook = [[m_books objectAtIndex:section] 
                       objectAtIndex:index];
  // 更新該物件的屬性
  alteredBook.title = title;
  alteredBook.detail = detail;
  alteredBook.category = [NSNumber numberWithInt:category];
  NSError* error = nil;
  // 將物件的變更存進資料庫
  if (![[appDelegate managedObjectContext] save:&error]) {
    NSLog(@"物件更新失敗");
  }
  // 更改目前m_currentObject這個array的狀態
  [[m_books objectAtIndex:section]
   replaceObjectAtIndex:index withObject:alteredBook];
  // 呼叫reloadData更新表格視覺上看到的內容
  [self.tableView reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*7*/
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    // 取出被管理的該物件
    Book* bookToDelete = [[m_books objectAtIndex:indexPath.section]
                          objectAtIndex:indexPath.row];
    // 將它設定成managedObjectContext中要被刪除的物件
    [[appDelegate managedObjectContext] 
     deleteObject:bookToDelete];
    // 將資料變更同步進資料庫
    NSError* error = nil;
    if (![[appDelegate managedObjectContext] save:&error]) {
      NSLog(@"物件刪除失敗");
    } else {
      // 將這個table的data source也更新
      [[m_books objectAtIndex:indexPath.section]
       removeObjectAtIndex:indexPath.row];
 //     [m_currentObject removeObjectAtIndex:indexPath.row];
      // 操作表格動態刪去這一列
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      
    }

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
  // 取出該筆資料
  Book* currentBook = [[m_books objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
  // 從Storyboard中該ViewController取出並實例化
  ModBookViewController* modBookViewController = 
  [self.storyboard instantiateViewControllerWithIdentifier:@"ModBook"];
  // 將自身物件參照傳入
  modBookViewController.parentTableViewController = self;
  // 設定該筆資料目前的值
  modBookViewController.currentTitle = currentBook.title;
  modBookViewController.currentDetail = currentBook.detail;
  modBookViewController.currentCategory = [currentBook.category intValue];
  modBookViewController.currentSection = indexPath.section;
  modBookViewController.currentRow = indexPath.row;
  // 加入Navigation Controller之中
  [self.navigationController pushViewController:modBookViewController 
                                       animated:YES];
}

@end
