//
//  MoviesListTableViewController.m
//  Top Movies Myers
//
//  Created by Christopher Myers on 6/4/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "MoviesListTableViewController.h"
#import "Movie.h"

@interface MoviesListTableViewController () <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) NSMutableArray * moviesArray;
@property (strong, nonatomic) Movie * currentMovie;


@end

@implementation MoviesListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moviesArray = [[NSMutableArray alloc] init];
    [self loadJSONFile];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    UIImage * theImage = [self imageFromURLString:self.currentMovie.posterPath];
    
    cell.textLabel.text = self.currentMovie.originalTitle;
    cell.imageView.image = theImage;
    
                            
    return cell;
}



@end
