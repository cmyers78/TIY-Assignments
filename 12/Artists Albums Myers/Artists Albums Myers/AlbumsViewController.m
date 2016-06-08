//
//  AlbumsViewController.m
//  Artists Albums Myers
//
//  Created by Christopher Myers on 6/7/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "AlbumsViewController.h"
#import "Album.h"

@interface AlbumsViewController ()

@property (strong, nonatomic) NSMutableArray * albumsArray;
@property (strong, nonatomic) Album * currentAlbum;


@end

@implementation AlbumsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.albumsArray = [[NSMutableArray alloc] init];
    
    [self parseJSON];
}


-(void) parseJSON {
    // 1. Load the json string
    
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"sturgill" ofType:@"json"];
    
    NSString * jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSLog(@"jsonString is: %@", jsonString);
    
    // 2. Convert to NSData from string
    
    NSData * albumData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (albumData != nil) {
        NSError * jsonError = nil;
        
        // 3. Get NSDictionary using JSON Serialization
        NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:albumData options:NSJSONReadingAllowFragments error:&jsonError];
        
        if (jsonError == nil) {
            
            //NSLog(@"Success.  I have the dictionary: %@", jsonDictionary);
            
            NSArray * itemsArray = [jsonDictionary valueForKey:@"items"];
            //NSLog(@"items array == %@", itemsArray);
            
            for (NSDictionary * itemDict in itemsArray) {
                Album * theAlbum = [[Album alloc] initWithDictionary:itemDict];
                [self.albumsArray addObject:theAlbum];
            }
        } else {
            NSLog(@"An error occured == %@", [jsonError localizedDescription]);
        }
    }else {
        NSLog(@"I was not able to create the NSData");
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.albumsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.currentAlbum = [self.albumsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = self.currentAlbum.albumName;
    cell.imageView.image = [self imageFromURLString:self.currentAlbum.thumbnailURLString];
    
    return cell;
}

// takes a urlstring and converts it into an image
// parameter needed is the url in string format
-(UIImage *)imageFromURLString:(NSString *)urlString {
    // creates an empty image object
    UIImage *theImage = nil;
    
    // converts the string into an NSURL object
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"Attempting to Load urlString == %@", urlString);
    
    // converts the NSURL into a data object
    if(url != nil) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // assuming there is data, the data is converted to an image object
        if(data != nil) {
            theImage = [UIImage imageWithData:data];
        }
    }
    return theImage;
}

@end
