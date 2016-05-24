//
//  ViewController.m
//  AgentAppMyers
//
//  Created by Christopher Myers on 5/24/16.
//  Copyright © 2016 DragomanDevelopers, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSString *agentName;
    NSString *password;
    
}

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *authenticateButton;

@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    agentName = @"Christopher Myers";
    password = @"123456";
    
}

- (void)authenticate {
    
    if ([self.userNameTextField.text isEqualToString:agentName] && [self.passwordTextField.text isEqualToString:password]) {
        
        self.view.backgroundColor = [UIColor greenColor];
        self.welcomeLabel.text = [NSString stringWithFormat:@"Welcome %@", agentName];
        
        
    } else {
        self.view.backgroundColor = [UIColor redColor];
        self.welcomeLabel.text = [NSString stringWithFormat:@"DENIED"];
        
        
    }

    
}

- (IBAction)authenticateButton:(UIButton *)sender {

    
    [self authenticate];
    
    
    
}


@end
