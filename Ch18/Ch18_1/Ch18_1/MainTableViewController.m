//
//  MainTableViewController.m
//  Ch18_1
//
//  Created by Ho Mark on 12/7/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainTableViewController.h"
#import "SelectedImageViewController.h"
@interface MainTableViewController ()

@end

@implementation MainTableViewController

-(void) checkSourceTypes {
  // UIImagePickerControllerSourceType是一個int型別
  // 將它包進NSNumber中
  m_sourceTypeArray = 
  [NSArray 
   arrayWithObjects:
   [NSNumber 
    numberWithInt:UIImagePickerControllerSourceTypePhotoLibrary],
   [NSNumber 
    numberWithInt:UIImagePickerControllerSourceTypeCamera],
   [NSNumber 
    numberWithInt:UIImagePickerControllerSourceTypeSavedPhotosAlbum]
   ,nil];
  [m_sourceTypeArray retain];
  // 初始化顯示字串的字典
  m_titleDictionary = 
  [[NSDictionary dictionaryWithObjectsAndKeys:
    @"媒體內容從照片函式庫取得",[m_sourceTypeArray objectAtIndex:0],
    @"媒體內容從相機取得",[m_sourceTypeArray objectAtIndex:1],
    @"媒體內容從相片的存檔選取",[m_sourceTypeArray objectAtIndex:2],
   nil]retain];
  // 初始化表格的資料來源
  m_tableData = [[NSMutableArray alloc]initWithCapacity:0];
  // 迭代並檢視結果
  for (NSNumber* sourceType in m_sourceTypeArray) {
    if ([UIImagePickerController 
         isSourceTypeAvailable:[sourceType intValue]]) {
      // 如果來源存在就加入表格的內容
      [m_tableData addObject:sourceType];
    }
  }
}

-(NSString*) checkMediaTypes :(int) sourceType{
  // 使用availableMediaTypesForSourceType
  // 取得支援的媒體類型
  NSArray* availableType = 
  [UIImagePickerController 
   availableMediaTypesForSourceType: sourceType];
  // 準備輸出字串
  NSString* returnString=@"";
  for (NSString* type in availableType) {
    // 串接輸出的字串
    returnString = [returnString 
                    stringByAppendingFormat:@"%@ ",type];
  }
  return returnString;
}


-(id) initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self checkSourceTypes];
  }
  return self;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  // 主要標題是從字典中取得字串
  cell.textLabel.text = 
  [m_titleDictionary 
   objectForKey:[m_tableData objectAtIndex:indexPath.row]];
  // 詳細描述是支援的媒體型態
  cell.detailTextLabel.text = 
  [self 
   checkMediaTypes:[[m_tableData objectAtIndex:indexPath.row]intValue]];
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

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  // 覆寫取消畫面時，只要將這個顯示的UIImagePickerController取消即可
  [self dismissModalViewControllerAnimated:YES];
}
-(void) imagePickerController:(UIImagePickerController *)picker 
didFinishPickingMediaWithInfo:(NSDictionary *)info {
  // 按下快門一樣取消UIImagePickerController
  [self dismissModalViewControllerAnimated:NO];
  // 執行photoDetail的segue切換畫面
  // 將info當作參數傳入
  [self performSegueWithIdentifier:@"photoDetail" sender:info];
  
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"photoDetail"]) {
    // 取得選取時的參數字典
    NSDictionary* info = (NSDictionary*) sender;
    // 取出SelectedImageViewController的實例
    SelectedImageViewController* selectedImageViewController = 
    (SelectedImageViewController*)[segue destinationViewController];
    // 設定選取的影像資訊
    selectedImageViewController.image = 
    (UIImage*)[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //  設定選取的標籤資訊
    selectedImageViewController.label = 
    [(NSURL*)[info objectForKey:@"UIImagePickerControllerReferenceURL"] path];
  }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // 取得點擊對應的來源型態
  int sourceType = [[m_tableData objectAtIndex:indexPath.row] intValue];
  // 如果不是從相機元件來的
  if(sourceType == UIImagePickerControllerSourceTypePhotoLibrary || 
     sourceType == UIImagePickerControllerSourceTypeSavedPhotosAlbum) {
    // 展現該畫面
    UIImagePickerController*  pickerController = [[UIImagePickerController alloc]init];
    pickerController.sourceType = sourceType;
    pickerController.delegate = self;
    [self presentModalViewController:pickerController animated:YES];
    [pickerController release];
  } else if (sourceType == UIImagePickerControllerSourceTypeCamera) {
    [self performSegueWithIdentifier:@"cameraConfig" sender:nil];
  }
}

@end
