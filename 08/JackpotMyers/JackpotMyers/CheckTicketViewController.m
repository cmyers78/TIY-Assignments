//
//  CheckTicketViewController.m
//  JackpotMyers
//
//  Created by Christopher Myers on 6/1/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "CheckTicketViewController.h"
#import "Ticket.h"


@interface CheckTicketViewController ()
@property (strong, nonatomic) NSArray * pickerWheel;

@property (weak, nonatomic) IBOutlet UILabel *checkTicketLabel;

@end

@implementation CheckTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerWheel = [[NSArray alloc] init];
    
    self.pickerWheel = @[@" ", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53"];

    self.picker.dataSource = self;
    self.picker.delegate = self;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 6;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerWheel count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerWheel[row];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //NSLog(@"I selected: %ld in component %ld", row, component);
    
    self.checkedTicket = [self.pickerWheel objectAtIndex:row];
    
    
}

- (IBAction)checkTicketPressed:(UIButton *)sender {
    if (self.winningTicketJP == self.checkedTicket) {
        self.checkTicketLabel.text = @"You have won!";
    } else {
        self.checkTicketLabel.text = @"You did not win";
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
