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


@end

@implementation JackpotTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ticketCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (IBAction)addTicket:(UIBarButtonItem *)sender {
    
   // NSLog(@"add ticket");
}

- (IBAction)checkTicketPressed:(UIBarButtonItem *)sender {
   // NSLog(@"check Ticket Pressed");
    
    [self chooseWinningTicket];
    
}


@end
