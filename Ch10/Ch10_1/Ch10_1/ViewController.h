//
//  ViewController.h
//  Ch10_1
//
//  Created by Ho Mark on 12/4/5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
  IBOutlet UITextField* m_locationString;
  
}

-(IBAction) openOtherApp;
-(IBAction) openSafari;
-(IBAction) openEmail;
-(IBAction) openDial;
-(IBAction) openSms;
-(IBAction) openMap;
-(IBAction) openYouTube;
-(IBAction) openStore;
@end
