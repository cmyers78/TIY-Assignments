//
//  MoviesDetailViewController.h
//  Top Movies Myers
//
//  Created by Christopher Myers on 6/4/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MoviesDetailViewController : UIViewController

@property (strong, nonatomic) Movie * theMovie;
@property (strong, nonatomic) UIImage *detailPoster;



@end
