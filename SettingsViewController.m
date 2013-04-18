//
//  SettingsViewController.m
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    [_tableView setDelegate:self];
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
    [self.view setBackgroundColor:backgroundPattern];
     
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.title = @"Settings";
    self.parentViewController.navigationItem.leftBarButtonItem = nil;
    self.parentViewController.navigationItem.rightBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
