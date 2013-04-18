//
//  NewGameViewController.h
//  iGamble
//
//  Created by Binyan Chen on 4/14/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewGameViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *betValue;
- (IBAction)yesPressed:(id)sender;
- (IBAction)noPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDatePicker;
@property (weak, nonatomic) IBOutlet UITextView *description;
@property (weak, nonatomic) IBOutlet UITextField *gameTitle;
- (IBAction)editDate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
- (IBAction)cancelDateEdit:(id)sender;
- (IBAction)doneDateEdit:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *shadowView;
@property (weak, nonatomic) IBOutlet UIView *dateEditView;
@property (weak, nonatomic) IBOutlet UILabel *balance;


@end
