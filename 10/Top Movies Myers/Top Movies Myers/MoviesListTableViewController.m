//
//  MoviesListTableViewController.m
//  Top Movies Myers
//
//  Created by Christopher Myers on 6/4/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "MoviesListTableViewController.h"
#import "Movie.h"
#import "MoviesDetailViewController.h"

@interface MoviesListTableViewController () <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) NSMutableArray * moviesArray;
@property (strong, nonatomic) Movie * currentMovie;
@property (strong, nonatomic) UIImage * thePoster;


@end

@implementation MoviesListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moviesArray = [[NSMutableArray alloc] init];
    [self loadJSONFile];
    

}


-(void)loadJSONFile {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"popular" ofType:@"json"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    //NSLog(@"%@", jsonString);
    
    
    NSError *error = nil;
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if(error == nil) {
        //NSLog(@"jsonArray == %@", jsonArray);
        
        NSArray *resultsArray = [jsonDictionary objectForKey:@"results"];
        
        for(NSDictionary *dict in resultsArray) {
            NSLog(@"dict == %@", dict);
            
            Movie *m = [[Movie alloc] init];
            
            NSString *title = [dict objectForKey:@"original_title"];
            
            if (title != nil) {
                m.originalTitle = title;
            } else {
                m.originalTitle =@"";
                NSLog(@"Could not parse title field");
            }
            
            NSString *posterPath = [dict objectForKey:@"poster_path"];
            
            if (posterPath != nil) {
                m.posterPath = posterPath;
            } else {
                m.posterPath =@"";
                NSLog(@"Could not parse powers field");
            }
            
            if (m != nil) {
                [self.moviesArray addObject:m];
            }
            NSLog(@"Movie Count: %ld", self.moviesArray.count);
        }
        
    } else {
        NSLog(@"Could not parse json into NSDictionary");
    }
}

-(UIImage *)imageFromURLString:(NSString *)urlString {
    
    UIImage *theImage = nil;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"Attempting to Load urlString == %@", urlString);
    
    if(url) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        if(data) {
            theImage = [UIImage imageWithData:data];
        }
    }
    return theImage;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.moviesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.currentMovie = [self.moviesArray objectAtIndex:indexPath.row];
    
    self.thePoster = [self imageFromURLString:self.currentMovie.posterPath];
    
    
    cell.textLabel.text = self.currentMovie.originalTitle;
    cell.imageView.image = self.thePoster;
    
                            
    return cell;
}

// this method will allow the user to select a cell and access the data inside the cell.
// however, you must call the self.currentMovie AND self.Poster methods again for the correct datat to be loaded.
// I only called the first one, and the originial title would load fine, but the poster would not....until I called the second method again
// both of these methods were called above in the cellForRowAtIndexPath method

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.currentMovie = [self.moviesArray objectAtIndex:indexPath.row];
    self.thePoster = [self imageFromURLString:self.currentMovie.posterPath];
    
    [self performSegueWithIdentifier:@"detailSegue" sender:nil];
    
}

// this sends the data to the next view controller
// a pointer must be created to send the data--I called mine viewController
// detailPoster is the variable name for the UIImage on the next screen
// It is set equal to the Poster Image on the first screen

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    MoviesDetailViewController *viewController = (MoviesDetailViewController *) segue.destinationViewController;
    
    viewController.theMovie = self.currentMovie;
    viewController.detailPoster = self.thePoster;
    
}
@end
