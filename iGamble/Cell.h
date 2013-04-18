//
//  Cell.h
//  iGamble
//
//  Created by Binyan Chen on 4/5/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *creator;
@property (weak, nonatomic) IBOutlet UILabel *postiveBets;
@property (weak, nonatomic) IBOutlet UILabel *negativeBets;
@property (weak, nonatomic) IBOutlet UILabel *bets;
@property (weak, nonatomic) IBOutlet UILabel *value;

@end
