//
//  Bet.h
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bet : NSObject

@property unsigned int userId;
@property NSString *userFirstName;
@property NSString *userLastName;
@property bool choice;
@property unsigned int value;

@end
