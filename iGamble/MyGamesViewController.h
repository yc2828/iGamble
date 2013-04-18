//
//  MyGamesViewController.h
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppInfo.h"
#import "Cell.h"
#import "GambleGame.h"
#import "Bet.h"
#import "User.h"
#import "AppInfo.h"

@interface MyGamesViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *myGames;
@property (nonatomic, strong) AppInfo *appInfo;
@property bool showJoined;
@property bool showCreated;
@property bool showInvited;
- (IBAction)invitedPressed:(id)sender;
- (IBAction)createdPressed:(id)sender;
- (IBAction)joinedPressed:(id)sender;


@end
