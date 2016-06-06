//
//  MoviesDetailViewController.m
//  Top Movies Myers
//
//  Created by Christopher Myers on 6/4/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "MoviesDetailViewController.h"
#import "Movie.h"


@interface MoviesDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;

@end

@implementation MoviesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.movieTitle.text = self.theMovie.originalTitle;
    //self.movieImageView.image = self.theMovie.posterPath;
    self.movieImageView.image = self.detailPoster;
    
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
