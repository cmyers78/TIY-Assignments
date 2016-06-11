//
//  LogInViewController.m
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *deniedLabel;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void) authenticate {
    Agent * logIn = [[Agent alloc] init];
    
    logIn.userName = @"Chris";
    logIn.password = @"1234";
    
    if ([self.userField.text isEqualToString:logIn.userName] && [self.passwordField.text isEqualToString:logIn.password]) {
        
        [self performSegueWithIdentifier:@"homeSegue" sender:nil];
    } else {
        self.deniedLabel.text = @"Your credentials do no match. Try Again";
    }
}


- (IBAction)authenticateButton:(UIButton *)sender {
    [self authenticate];
    
}

@end
