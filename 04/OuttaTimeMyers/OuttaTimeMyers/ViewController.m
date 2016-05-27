//
//  ViewController.m
//  OuttaTimeMyers
//
//  Created by Christopher Myers on 5/26/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *enteredTimeText;
@property (weak, nonatomic) IBOutlet UILabel *presentTime;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeDeparted;
@property (weak, nonatomic) IBOutlet UILabel *speedometer;
@property (strong, nonatomic) NSDateFormatter *formattedDate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.formattedDate = [[NSDateFormatter alloc] init];
    self.formattedDate.dateFormat = @"MMM d, yyyy";
    NSDate *today = [NSDate date];
    self.presentTime.text = [self.formattedDate stringFromDate:today];
    
    
}



- (IBAction)travelButton:(UIButton *)sender {
}

@end
