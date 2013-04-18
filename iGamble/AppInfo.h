//
//  GameInfo.h
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface AppInfo : NSObject

@property User *currentUser;


+(AppInfo *)getInstance;
@end
