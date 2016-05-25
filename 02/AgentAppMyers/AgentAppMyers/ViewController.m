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
    NSArray *listItems;
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
    listItems = [agentName componentsSeparatedByString:@" "];
}

- (void)authenticate {
    
    if ([self.userNameTextField.text isEqualToString:agentName] && [self.passwordTextField.text isEqualToString:password]) {
        
        self.view.backgroundColor = [UIColor colorWithRed:107/255.0f green:142/255.0f blue:35/255.0f alpha:1];
        
        self.welcomeLabel.text = [NSString stringWithFormat:@"Welcome Agent %@", listItems[1]];
        
    } else {
        self.view.backgroundColor = [UIColor colorWithRed:222/255.0f green:15/255.0f blue:15/255.0f alpha:1];
        self.welcomeLabel.text = [NSString stringWithFormat:@"DENIED"];
    }
}

- (IBAction)authenticateButton:(UIButton *)sender {

    [self authenticate];
}

@end
