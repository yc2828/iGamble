//
//  User.h
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property unsigned int userId;
@property NSString *lastName;
@property NSString *firstName;
@property NSMutableArray *friends;
@property NSURL *avatar;
@property unsigned long int balance;
@property NSMutableArray *playedGames;
@property NSMutableArray *createdGames;

@end
