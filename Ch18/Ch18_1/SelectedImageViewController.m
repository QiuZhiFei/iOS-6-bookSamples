//
//  SelectedImageViewController.m
//  Ch18_1
//
//  Created by Ho Mark on 12/7/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SelectedImageViewController.h"

@interface SelectedImageViewController ()

@end

@implementation SelectedImageViewController
@synthesize image;
@synthesize label;

- (void)viewDidLoad
{
  [super viewDidLoad];
	selectedImage.image = image;
  imageLabel.text = label;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
