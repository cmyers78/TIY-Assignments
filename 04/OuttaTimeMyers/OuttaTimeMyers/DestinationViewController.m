//
//  ViewController.m
//  OuttaTimeMyers
//
//  Created by Christopher Myers on 5/26/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "DestinationViewController.h"

@interface DestinationViewController () <UITextFieldDelegate>
{ int milesPerHour;
}



@property (weak, nonatomic) IBOutlet UITextField *enteredTimeText;
@property (weak, nonatomic) IBOutlet UILabel *presentTime;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeDeparted;
@property (weak, nonatomic) IBOutlet UILabel *speedometer;
@property (strong, nonatomic) NSDateFormatter *formattedDate;
@property (strong, nonatomic) NSTimer *timerMPH;

@end

@implementation DestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.enteredTimeText setValue:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.formattedDate = [[NSDateFormatter alloc] init];
    self.formattedDate.dateFormat = @"MMM d, yyyy";
    NSDate *today = [NSDate date];
    self.presentTime.text = [self.formattedDate stringFromDate:today];
}

// this method will remove keyboard from the app
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.enteredTimeText resignFirstResponder];
    
    return YES;
}

- (void) updateMiles {
    milesPerHour += 1;
    if (milesPerHour == 88) {
        [self.timerMPH invalidate];
    }
    self.speedometer.text = [NSString stringWithFormat:@"%i MPH", milesPerHour];
}


- (IBAction)travelButton:(UIButton *)sender {
    
    self.lastTimeDeparted.text = self.presentTime.text;
    milesPerHour = 0;
    float speed = 0.1;
    self.timerMPH = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(updateMiles) userInfo:nil repeats:YES];
    
}

@end
