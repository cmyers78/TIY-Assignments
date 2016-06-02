//
//  JackpotTableViewController.m
//  JackpotMyers
//
//  Created by Christopher Myers on 6/1/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "JackpotTableViewController.h"
#import "Ticket.h"


@interface JackpotTableViewController ()
@property (strong, nonatomic) NSMutableArray * ticketsArray;
@property (strong, nonatomic) Ticket * winningTicket;
@property (strong, nonatomic) Ticket * randomTicket;
@property (strong, nonatomic) Ticket * currentTicket;

@end

@implementation JackpotTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ticketsArray = [[NSMutableArray alloc] init];
    
    [self chooseWinningTicket];
}
- (void) createTicket {
    [self generateRandomTicket];
    Ticket * ticket = [[Ticket alloc] initWithName:@"Chris" lastName:@"Myers" lottoTicket:self.randomTicket.lottoTicket];
    
    [self.ticketsArray addObject:ticket];
    
}

- (void) generateRandomTicket {
    self.randomTicket = [[Ticket alloc] init];
    
    int number1 = arc4random_uniform(53) +1;
    int number2 = arc4random_uniform(53) +1;
    int number3 = arc4random_uniform(53) +1;
    int number4 = arc4random_uniform(53) +1;
    int number5 = arc4random_uniform(53) +1;
    int number6 = arc4random_uniform(53) +1;
    
    self.randomTicket.lottoTicket = [NSString stringWithFormat:@"%i %i %i %i %i %i", number1, number2, number3, number4, number5, number6];
    
}

- (void) chooseWinningTicket {
    self.winningTicket = [[Ticket alloc] init];
    
    int number1 = arc4random_uniform(53) +1;
    int number2 = arc4random_uniform(53) +1;
    int number3 = arc4random_uniform(53) +1;
    int number4 = arc4random_uniform(53) +1;
    int number5 = arc4random_uniform(53) +1;
    int number6 = arc4random_uniform(53) +1;
    
    self.winningTicket.lottoTicket = [NSString stringWithFormat:@"%i %i %i %i %i %i", number1, number2, number3, number4, number5, number6];
    //NSLog(@"The winning ticket is: %@", self.winningTicket.lottoTicket);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.ticketsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ticketCell" forIndexPath:indexPath];
    
    // Configure the cell...
    self.currentTicket = [self.ticketsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = self.currentTicket.lottoTicket;
    
    return cell;
}

- (IBAction)addTicket:(UIBarButtonItem *)sender {
    
   // NSLog(@"add ticket");
    [self createTicket];
    [self.tableView reloadData];
    
}

- (IBAction)checkTicketPressed:(UIBarButtonItem *)sender {
   // NSLog(@"check Ticket Pressed");
    [self performSegueWithIdentifier:@"checkTicketSegue" sender:self];
    
    
}


@end
