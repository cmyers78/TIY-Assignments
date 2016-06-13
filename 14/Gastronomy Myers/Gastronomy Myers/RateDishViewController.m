//
//  RateDishViewController.m
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "RateDishViewController.h"

@interface RateDishViewController () {
    float rated;
}

@property (weak, nonatomic) IBOutlet UISlider *ratingSlider;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end

@implementation RateDishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    rated = [self.currentRating floatValue];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateRatingValue];
}

- (void) updateRatingValue {
    self.ratingLabel.text = [NSString stringWithFormat:@"%1.0f", rated];
    self.ratingSlider.value = rated;
}

- (IBAction)ratingSliderTapped:(UISlider *)sender {
    
    rated = ceilf(self.ratingSlider.value);
    [self updateRatingValue];
    
}

@end
