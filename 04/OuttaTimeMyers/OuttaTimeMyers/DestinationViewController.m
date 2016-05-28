//
//  ViewController.m
//  OuttaTimeMyers
//
//  Created by Christopher Myers on 5/26/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "DestinationViewController.h"

@interface DestinationViewController () <UITextFieldDelegate> {
    int milesPerHour;
}

@property (weak, nonatomic) IBOutlet UITextField *enteredTimeText;
@property (weak, nonatomic) IBOutlet UILabel *presentTime;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeDeparted;
@property (weak, nonatomic) IBOutlet UILabel *speedometer;
@property (strong, nonatomic) NSDateFormatter *formattedDate;
@property (strong, nonatomic) NSTimer *timerMPH;
@property (strong, nonatomic) AVAudioPlayer *player;


@end

@implementation DestinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"BTTF" ofType:@"m4a"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    self.player.numberOfLoops = -1;
    self.player.volume = 0.60;
    
    [self.player play];
    
    [self.enteredTimeText setValue:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.formattedDate = [[NSDateFormatter alloc] init];
    self.formattedDate.dateFormat = @"MMM d, yyyy";
    NSDate *today = [NSDate date];
    self.presentTime.text = [self.formattedDate stringFromDate:today];

}

- (void) enteredDate {
    
    self.formattedDate.dateFormat = @"MMddyyyy";
    NSString *dateEntered = self.enteredTimeText.text;
    NSDate *theDate = [self.formattedDate dateFromString:dateEntered];
    self.formattedDate.dateFormat = @"MMM d, yyyy";
    self.enteredTimeText.text = [self.formattedDate stringFromDate:theDate];
    
}
// this method will remove keyboard from the app
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self enteredDate];
    [self.enteredTimeText resignFirstResponder];
    return YES;
}

- (void) updateMiles {
    milesPerHour += 1;
    if (milesPerHour == 88) {
        [self.timerMPH invalidate];
        [self.player stop];
        [self performSegueWithIdentifier:@"popupSegue" sender:self];
    }
    self.speedometer.text = [NSString stringWithFormat:@"%i MPH", milesPerHour];
}

- (void) reset {
    
    self.lastTimeDeparted.text = @"--- -- ----";
    self.enteredTimeText.text = @"";
    milesPerHour = 0;
    self.speedometer.text = @"0 MPH";
    [self.player play];
    
}

- (IBAction)unwindSegue:(UIStoryboardSegue *) segue {
    NSLog(@"unwindSegue");
    
    [self reset];
}

- (IBAction)travelButton:(UIButton *)sender {
    
    self.lastTimeDeparted.text = self.presentTime.text;
    milesPerHour = 0;
    float speed = 0.1;
    self.timerMPH = [NSTimer scheduledTimerWithTimeInterval:speed
                    target:self selector:@selector(updateMiles)
                    userInfo:nil repeats:YES];
    }

@end
