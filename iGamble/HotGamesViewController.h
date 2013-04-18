//
//  HotGamesViewController.h
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "GambleGame.h"


@interface HotGamesViewController : UITableViewController <NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property (nonatomic, strong) NSMutableArray *hotGames;
@property (nonatomic, strong) NSMutableData *receivedData;

@end
