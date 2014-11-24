//
//  CameraSetupViewController.m
//  Ch18_1
//
//  Created by Ho Mark on 12/7/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CameraSetupViewController.h"
#import "SelectedImageViewController.h"
@interface CameraSetupViewController ()

@end

@implementation CameraSetupViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [m_cameraDeviceSegment release];
    m_cameraDeviceSegment = nil;
    [m_cameraCaptureModeSegment release];
    m_cameraCaptureModeSegment = nil;
    [m_cameraFlashModeSegment release];
    m_cameraFlashModeSegment = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [m_cameraDeviceSegment release];
    [m_cameraCaptureModeSegment release];
    [m_cameraFlashModeSegment release];
    [super dealloc];
}
- (IBAction)execCamera:(id)sender {
  // 初始化UIImagePickerController
  m_imagePickerController  = 
  [[UIImagePickerController alloc]init];
  // 設定代理物件為自身物件
  m_imagePickerController.delegate = self;
  //設定來源是相機
  m_imagePickerController.sourceType = 
  UIImagePickerControllerSourceTypeCamera;
  // 依照使用者的輸入執行相機參數設定
  [self setupCamera];
//  m_imagePickerController.showsCameraControls = NO;
  // 顯示畫面
  [self 
   presentModalViewController:m_imagePickerController 
   animated:YES];
  [m_imagePickerController release];
}

-(void) setupCamera {
  if (m_imagePickerController) {
    // 設定使用前鏡頭或者是後鏡頭
    switch (m_cameraDeviceSegment.selectedSegmentIndex) {
      case 0:
        m_imagePickerController.cameraDevice = 
        UIImagePickerControllerCameraDeviceRear;
        break;
      case 1:
        m_imagePickerController.cameraDevice = 
        UIImagePickerControllerCameraDeviceFront;
        break;
        
      default:
        break;
    }
    // 設定是相片還是影片模式
    switch (m_cameraCaptureModeSegment.selectedSegmentIndex) {
      case 0:
        // 設定為相片模式
        m_imagePickerController.cameraCaptureMode = 
        UIImagePickerControllerCameraCaptureModePhoto;
        break;
      case 1:
        // 設定可以使用所有照相功能的媒體格式
        m_imagePickerController.mediaTypes = 
        [UIImagePickerController availableMediaTypesForSourceType:
         UIImagePickerControllerSourceTypeCamera];
        // 設定為影片模式
        m_imagePickerController.cameraCaptureMode = 
        UIImagePickerControllerCameraCaptureModeVideo;
        break;        
      default:
        break;
    }
    // 設定閃光燈的模式
    switch (m_cameraFlashModeSegment.selectedSegmentIndex) {
      case 0:
        m_imagePickerController.cameraFlashMode = 
        UIImagePickerControllerCameraFlashModeOff;
        break;
      case 1:
        m_imagePickerController.cameraFlashMode = 
        UIImagePickerControllerCameraFlashModeAuto;
        break;
      case 2:
        m_imagePickerController.cameraFlashMode = 
        UIImagePickerControllerCameraFlashModeOn;
        break;
      default:
        break;
    }
  }
  
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  // 覆寫取消畫面時，只要將這個顯示的UIImagePickerController取消即可
  [self dismissModalViewControllerAnimated:YES];
}
-(void) imagePickerController:(UIImagePickerController *)picker 
didFinishPickingMediaWithInfo:(NSDictionary *)info {
  // 將檔案的資訊取出
  UIImage* image = 
  (UIImage*)[info objectForKey:@"UIImagePickerControllerOriginalImage"];
  // 將檔案存入相片集中
  UIImageWriteToSavedPhotosAlbum (image, nil, nil , nil);
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
    // 取得相片的後設資訊
    NSDictionary* metaData = 
    [info objectForKey:@"UIImagePickerControllerMediaMetadata"];
    // 取得相片的EXIF資訊
    NSDictionary* exifData = [metaData objectForKey:@"{Exif}"];
    // 將照相的時間取出
    NSString* photoData = [exifData objectForKey:@"DateTimeOriginal"];
    selectedImageViewController.label = 
    [NSString stringWithFormat:@"拍攝時間:%@",photoData];
  }
}



@end
