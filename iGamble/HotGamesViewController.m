//
//  HotGamesViewController.m
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import "HotGamesViewController.h"

@interface HotGamesViewController ()

@end

@implementation HotGamesViewController
@synthesize receivedData,hotGames;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIImage *backgroundImage = [UIImage imageNamed:@"background.png"];
    UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
    receivedData = [[NSMutableData alloc] init];
    hotGames = [[NSMutableArray alloc] init];
    [self.view setBackgroundColor:backgroundPattern];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self getHotGames];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.navigationItem.title = @"Hot Games";
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createGame:)];
    self.parentViewController.navigationItem.leftBarButtonItem = createButton;
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshHotGames:)];
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
    return [hotGames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    GambleGame *game = [hotGames objectAtIndex:indexPath.row];
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

#pragma mark - segue
-(void)createGame:(id)sender{
    [self performSegueWithIdentifier:@"createSegueFromHotGames" sender:sender];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"HotGamesSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        GambleGame *game = [hotGames objectAtIndex:indexPath.row];
        [[segue destinationViewController] setGame:game];
    }
}

#pragma mark - connection
-(void)getHotGames{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://54.235.158.217/hot_games.php"]];
    [request setHTTPMethod:@"GET"];
    [request addValue:@"getValues" forHTTPHeaderField:@"METHOD"];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(!connection)
    {
        NSLog(@"Connection Failed");
    }
}
#pragma mark - connection delegate
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    //NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    //NSLog(@"dataString: %@",jsonStr);
    [receivedData appendData:data];
    
    //NSArray *array= dictionary objectForKey:<#(id)#>
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connection Failed with error: %@",error.localizedDescription);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *error = nil;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:&error];
    if (error)
    {
        NSLog(@"Error");
    }
    for (NSDictionary *gameObj in array){
        GambleGame *game = [[GambleGame alloc] init];
        game.title = [gameObj objectForKey:@"title"];
        game.description = [gameObj objectForKey:@"description"];
        game.gameId = [[gameObj objectForKey:@"game_id"] unsignedIntValue];
        game.creatorId = [[gameObj objectForKey:@"creator"] unsignedIntValue];
        game.creatorLastName = [gameObj objectForKey:@"creator_last_name"];
        game.creatorFirstName = [gameObj objectForKey:@"creator_first_name"];
        game.totalValue = [[gameObj objectForKey:@"total_value"] unsignedIntValue];
        game.yesBets = [[gameObj objectForKey:@"yes_bets"] unsignedIntValue];
        game.noBets = [[gameObj objectForKey:@"no_bets"] unsignedIntValue];
        [hotGames addObject:game];
    }
    [self.tableView reloadData];
}


@end
