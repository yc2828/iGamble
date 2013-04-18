//
//  GambleGame.h
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GambleGame.h"

@interface GambleGame : NSObject

@property GambleGame *game;
@property unsigned int gameId;
@property NSString *title;
@property NSString *description;
@property unsigned int creatorId;
@property NSString *creatorFirstName;
@property NSString *creatorLastName;
@property NSURL *createrAvatar;
@property NSDate *timeCreated;
@property NSMutableArray *invitedUsers;
@property NSMutableDictionary *betSet;
@property NSDate *timeEnd;
@property unsigned int yesBets;
@property unsigned int noBets;
@property unsigned long int totalValue;

@end
