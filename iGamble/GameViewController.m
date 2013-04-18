//
//  GameViewController.m
//  iGamble
//
//  Created by Binyan Chen on 4/5/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize game, played;

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
    _appInfo = [AppInfo getInstance];
    Bet *myBet = [game.betSet objectForKey:[NSNumber numberWithUnsignedInt:_appInfo.currentUser.userId]];
    if ( myBet == NULL)
    {
        played = NO;
        [_playedView setHidden:YES];
        [_scrollView setContentSize:CGSizeMake(320, 650)];
    }else
    {
        played = YES;
        [_playView setHidden:YES];
        [_scrollView setContentSize:CGSizeMake(320, 470)];
    }
    
    [super viewDidLoad];
    [_betValue setDelegate:self];
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
    _gameTitle.text = game.title;
    _description.text = game.description;
    _creator.text = [[NSString alloc] initWithFormat:@"%@ %@", game.creatorFirstName, game.creatorLastName];
    _startDate.text = [NSString stringWithFormat:@"%@", game.timeCreated];
    _endDate.text = [NSString stringWithFormat:@"%@", game.timeEnd];
    //NSNumber *positiveBets = ;
    //NSNumber *negativeBets = game.noBets;
    NSNumber *bets = [NSNumber numberWithInt:(game.yesBets + game.noBets)];
    _yesCount.text = [NSString stringWithFormat:@"%d", game.yesBets];
    _noCount.text = [NSString stringWithFormat:@"%d", game.noBets];
    _value.text = [[NSNumber numberWithUnsignedLong:game.totalValue] stringValue];
    _playerCount.text = [bets stringValue];
    NSData *data = [NSData dataWithContentsOfURL:game.createrAvatar];
    _avatar.image = [UIImage imageWithData:data];
    _balance.text = [[NSNumber numberWithUnsignedLong:_appInfo.currentUser.balance] stringValue];
    
    if (played)
    {
        NSString *choice = myBet.choice? @"YES" : @"NO";
        _playedInfo.text = [NSString stringWithFormat:@"You bet %u on %@ !", myBet.value, choice];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)betYes:(id)sender {
    //self.performBet:YES;
}

- (IBAction)betNo:(id)sender {
    //self.performBet:NO;
}

//keyboard listener
- (void)keyboardDidShow:(NSNotification *)notification
{
    [_scrollView setFrame:CGRectMake(0,0,320,200)];
    [_scrollView setContentOffset:CGPointMake(0, 420) animated:YES];
}
-(void)keyboardDidHide:(NSNotification *)notification
{
    [_scrollView setFrame:CGRectMake(0,0,320,450)];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [_betValue resignFirstResponder];
    return YES;
}
-(void)dismissKeyboard {
    [_betValue resignFirstResponder];
}
@end
