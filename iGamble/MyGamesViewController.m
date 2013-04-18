//
//  MyGamesViewController.m
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import "MyGamesViewController.h"

@interface MyGamesViewController ()

@end

@implementation MyGamesViewController
@synthesize myGames, showCreated, showInvited, showJoined;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //Authenticate user
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
    [self.view setBackgroundColor:backgroundPattern];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myGames = [[NSMutableArray alloc] init];
    showInvited = YES;
    showCreated = YES;
    showJoined = YES;
    
    _appInfo = [AppInfo getInstance];
    
    //self.getMyGames:(unsigned int) userId;
    
    //fake a set of games
    Bet *bet = [[Bet alloc] init];
    bet.userId = 1;
    bet.userFirstName = @"Paul";
    bet.userLastName = @"Chen";
    bet.choice = 0;
    bet.value = 150;
    Bet *bet1 = [[Bet alloc] init];
    bet1.userId = 2;
    bet1.userFirstName = @"Richard";
    bet1.userLastName = @"Meng";
    bet1.choice = 0;
    bet1.value = 200;
    Bet *bet2 = [[Bet alloc] init];
    bet2.userId = 3;
    bet2.userFirstName = @"Irene";
    bet2.userLastName = @"Chang";
    bet2.choice = 1;
    bet2.value = 120;
    
    GambleGame *game = [[GambleGame alloc] init];
    game.gameId = 1;
    game.title = @"Richard will go to see boxing tonight. He won't do homework.";
    game.description = @"Richard will go to see boxing tonight. He won't do homework.";
    game.creatorId = 1;
    game.creatorFirstName = @"Paul";
    game.creatorLastName =@"Chen";
    game.createrAvatar = [NSURL URLWithString:@"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash4/c41.41.518.518/s160x160/397883_100751700048322_1265792693_n.jpg"];
    game.timeCreated = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    //game.invitedUsers;
    game.betSet = [[NSMutableDictionary alloc] init];
    [game.betSet setObject:bet forKey:[NSNumber numberWithUnsignedInt:bet.userId ]];
    [game.betSet setObject:bet1 forKey:[NSNumber numberWithUnsignedInt:bet1.userId ]];
    [game.betSet setObject:bet2 forKey:[NSNumber numberWithUnsignedInt:bet2.userId ]];
    
    game.timeEnd = [[NSDate alloc] initWithTimeIntervalSinceNow:20];;
    game.yesBets = 2;
    game.noBets = 1;
    game.totalValue = 470;
    
    for (int i=0; i<10; i++)
    {
        [myGames addObject:game];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.title = @"My Games";
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createGame:)];
    self.parentViewController.navigationItem.leftBarButtonItem = createButton;
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshMyGames:)];
    self.parentViewController.navigationItem.rightBarButtonItem = refreshButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [myGames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    GambleGame *game = [myGames objectAtIndex:indexPath.row];
    cell.title.text = game.title;
    cell.creator.text = [[NSString alloc] initWithFormat:@"%@ %@", game.creatorFirstName, game.creatorLastName];
    NSNumber *bets = [NSNumber numberWithInt:(game.yesBets + game.noBets)];
    cell.postiveBets.text = [NSString stringWithFormat:@"%d", game.yesBets];
    cell.negativeBets.text = [NSString stringWithFormat:@"%d", game.noBets];
    cell.bets.text = [bets stringValue];
    cell.value.text = [[NSNumber numberWithUnsignedLong:game.totalValue] stringValue];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"MyGamesSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        GambleGame *game = [myGames objectAtIndex:indexPath.row];
        [[segue destinationViewController] setGame:game];
    }
}

- (IBAction)invitedPressed:(id)sender {
    UIButton *button = sender;
    showInvited = !showInvited;
    if (showInvited) {
        UIImage *back = [UIImage imageNamed:@"button-gray-enabled.png"];
        [button setBackgroundImage:back forState:UIControlStateNormal];
    }else{
        UIImage *back = [UIImage imageNamed:@"button-gray.png"];
        [button setBackgroundImage:back forState:UIControlStateNormal];
    }
}
- (IBAction)createdPressed:(id)sender {
    UIButton *button = sender;
    showCreated = !showCreated;
    if (showCreated) {
        UIImage *back = [UIImage imageNamed:@"button-gray-enabled.png"];
        [button setBackgroundImage:back forState:UIControlStateNormal];
    }else{
        UIImage *back = [UIImage imageNamed:@"button-gray.png"];
        [button setBackgroundImage:back forState:UIControlStateNormal];
    }
}
- (IBAction)joinedPressed:(id)sender {
    UIButton *button = sender;
    showJoined = !showJoined;
    if (showJoined) {
        UIImage *back = [UIImage imageNamed:@"button-gray-enabled.png"];
        [button setBackgroundImage:back forState:UIControlStateNormal];
    }else{
        UIImage *back = [UIImage imageNamed:@"button-gray.png"];
        [button setBackgroundImage:back forState:UIControlStateNormal];
    }
}
-(void)createGame:(id)sender{
    [self performSegueWithIdentifier:@"createSegueFromMyGames" sender:sender];
}

@end
