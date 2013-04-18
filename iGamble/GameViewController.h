//
//  GameViewController.h
//  iGamble
//
//  Created by Binyan Chen on 4/5/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppInfo.h"
#import "GambleGame.h"
#import "Bet.h"

@interface GameViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)betYes:(id)sender;
- (IBAction)betNo:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *betValue;
@property (weak, nonatomic) IBOutlet UILabel *gameTitle;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UILabel *creator;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UILabel *yesCount;
@property (weak, nonatomic) IBOutlet UILabel *noCount;
@property (weak, nonatomic) IBOutlet UILabel *value;
@property (weak, nonatomic) IBOutlet UILabel *playerCount;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *balance;
@property (weak, nonatomic) IBOutlet UIView *playView;
@property (weak, nonatomic) IBOutlet UIView *playedView;
@property (weak, nonatomic) IBOutlet UILabel *playedInfo;
@property GambleGame *game;
@property bool played;
@property AppInfo *appInfo;
@end
