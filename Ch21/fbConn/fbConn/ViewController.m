//
//  ViewController.m
//  fbConn
//
//  Created by Ho Mark on 12/7/30.
//  Copyright (c) 2012年 Ho Mark. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  // 實作登入成功時的回應
	[[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(loginSuccess:)
   name:@"loginSuccess" object:nil];
  // 實作登出成功時的回應
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(logoutSuccess:)
   name:@"logoutSuccess" object:nil];

}
-(void) loginSuccess:(id) sender {
  m_statusLabel.text = @"登入成功";
}
-(void) logoutSuccess:(id) sender {
  m_statusLabel.text = @"登入未成功";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutFacebook:(id)sender {
  // 呼叫facebook的logout
  AppDelegate* appDelegate =
  (AppDelegate*) [[UIApplication sharedApplication]
                  delegate];
  [appDelegate.facebook logout];
}

- (IBAction)connectFacebook:(id)sender {
  // 呼叫AppDelegate的getFacebookStatus
  AppDelegate* appDelegate =
  (AppDelegate*) [[UIApplication sharedApplication]delegate];
  [appDelegate getFacebookStatus];
}

- (void)dealloc {
  [m_statusLabel release];
  [super dealloc];
}
@end
