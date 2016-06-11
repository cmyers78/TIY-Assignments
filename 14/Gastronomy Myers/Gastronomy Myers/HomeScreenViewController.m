//
//  HomeScreenViewController.m
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "HomeScreenViewController.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)diningOptionsPressed:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"restaurantSegue" sender:nil];
}

- (IBAction)aboutAppPressed:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"aboutSegue" sender:nil];
    
}

- (IBAction)unwindSegue:(UIStoryboardSegue *) segue {
    
}

@end
