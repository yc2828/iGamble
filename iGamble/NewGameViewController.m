//
//  NewGameViewController.m
//  iGamble
//
//  Created by Binyan Chen on 4/14/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import "NewGameViewController.h"

@interface NewGameViewController ()

@end

@implementation NewGameViewController

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
    [_scrollView setContentSize:CGSizeMake(320, 600)];
    [_shadowView setHidden:YES];
    [_dateEditView setHidden:YES];
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
    [self.view setBackgroundColor:backgroundPattern];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)yesPressed:(id)sender {
}

- (IBAction)noPressed:(id)sender {
}

//keyboard listener
- (void)keyboardDidShow:(NSNotification *)notification
{
    [_scrollView setFrame:CGRectMake(0,0,320,200)];
    if ( _scrollView.contentOffset.y < 100) {
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else{
        [_scrollView setContentOffset:CGPointMake(0, 340) animated:YES];
    }
}
-(void)keyboardDidHide:(NSNotification *)notification
{
    [_scrollView setFrame:CGRectMake(0,0,320,450)];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [_betValue resignFirstResponder];
    [_gameTitle resignFirstResponder];
    [_description resignFirstResponder];
    return YES;
}
-(void)dismissKeyboard {
    [_betValue resignFirstResponder];
    [_gameTitle resignFirstResponder];
    [_description resignFirstResponder];
}
- (IBAction)editDate:(id)sender {
    [_shadowView setHidden:NO];
    [_dateEditView setHidden:NO];
}
- (IBAction)cancelDateEdit:(id)sender {
    [_shadowView setHidden:YES];
    [_dateEditView setHidden:YES];
}

- (IBAction)doneDateEdit:(id)sender {
    _endDate.text = [NSString stringWithFormat:@"%@", _endDatePicker.date];
    [_shadowView setHidden:YES];
    [_dateEditView setHidden:YES];
}
@end
