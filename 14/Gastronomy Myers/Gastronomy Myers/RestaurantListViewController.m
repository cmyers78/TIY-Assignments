//
//  RestaurantListViewController.m
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "RestaurantListViewController.h"
#import "Restaurant.h"
#import "Dishes.h"
#import "RestaurantTableViewCell.h"
#import "MenuListViewController.h"


@interface RestaurantListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) NSMutableArray * restaurantArray;

@property (strong, nonatomic) Restaurant * currentRestaurant;


@end

@implementation RestaurantListViewController



- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.restaurantArray = [[NSMutableArray alloc] init];
    NSDictionary * theDictonary = [self parseRawJSON];
    //NSLog(@"the dictionary: %@", theDictonary);
    
    [self parseRefinedJSON:theDictonary];
    
    //NSLog(@"the number of restaurants is: %ld", self.restaurantArray.count);
    

}
#pragma mark - Delegate methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.restaurantArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RestaurantTableViewCell *cell = (RestaurantTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"restCell" forIndexPath:indexPath];
    
    
    self.currentRestaurant =[self.restaurantArray objectAtIndex:indexPath.row];
    
    cell.restNameLabel.text = self.currentRestaurant.restName;
    cell.restAddLabel.text = self.currentRestaurant.restAddress;
    
    NSString * concatenate = [self.currentRestaurant.restCity stringByAppendingString:@" "];
    NSString * concatenate1 = [concatenate stringByAppendingString:self.currentRestaurant.restState];
    NSString * concatenate2 = @", ";
    NSString * concatenate3 = [concatenate1 stringByAppendingString:concatenate2];
    NSString * finalConcat = [concatenate3 stringByAppendingString:self.currentRestaurant.restZip];
    
    cell.restCSZLabel.text = finalConcat;
    cell.restImage.image = [UIImage imageNamed:self.currentRestaurant.restImageString];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.currentRestaurant = [self.restaurantArray objectAtIndex:indexPath.row];
    
    //self.currentRestaurant.dishesArray = [self.restaurantArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"menuSegue" sender:nil];
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    MenuListViewController *viewController = (MenuListViewController *) segue.destinationViewController;
    viewController.theRestaurant = self.currentRestaurant;
    
}


- (NSDictionary *) parseRawJSON {
    // load JSON data into NSString
    // Get URLfor the file
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"restaurantData" ofType:@"json"];
    // load contents of file into an NSString
    NSString * jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    // Convert string into data object
    NSData * data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (data == nil) {
        NSLog(@"There was a problem loading the data");
    }
    // Create NSError
    NSError * jsonError = nil;
    
    //Convert NSData to NSDiction using JSONSerialization
    NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    
    return jsonDictionary;
}


-(void) parseRefinedJSON: (NSDictionary *) rawDictonary {
    
    NSArray * jsonArray = [rawDictonary objectForKey:@"restaurants"];
    
    for (NSDictionary * dict in jsonArray) {
        
        Restaurant * theRestaurant = [[Restaurant alloc] init];
        
        NSString * name = [dict objectForKey:@"name"];
        
        if (name != nil) {
            theRestaurant.restName = name;
        } else {
            theRestaurant.restName = @"";
            NSLog(@"I could not parse the name.");
        }
        
        NSString * desc = [dict objectForKey:@"description"];
        if (desc != nil) {
            theRestaurant.restDescription = desc;
        } else {
            theRestaurant.restDescription = @"";
            NSLog(@"I could not parse the restaurant description");
        }
        
        NSString * imageString = [dict objectForKey:@"imageNameString"];
        if (imageString != nil) {
            theRestaurant.restImageString = imageString;
        } else {
            theRestaurant.restImageString = @"";
            NSLog(@"I could not parse the restaurant image string");
        }
        
        NSString * address = [dict objectForKey:@"address"];
        if (address != nil) {
            theRestaurant.restAddress = address;
        } else {
            theRestaurant.restAddress = @"";
            NSLog(@"I could not parse the restaurant address");
        }
        
        NSString * city = [dict objectForKey:@"city"];
        if (city != nil) {
            theRestaurant.restCity = city;
        } else {
            theRestaurant.restCity = @"";
            NSLog(@" I could not parse the restaurant city");
        }
        
        NSString * state = [dict objectForKey:@"state"];
        if (state != nil) {
            theRestaurant.restState = state;
        } else {
            theRestaurant.restState = @"";
            NSLog(@"I could not parse the restaurant state");
        }
        
        NSString * zip = [dict objectForKey:@"zip"];
        if (zip != nil) {
            theRestaurant.restZip = zip;
        } else {
            theRestaurant.restZip = @"";
            NSLog(@"I could not parse the restaurant zipcode");
        }
        
        NSNumber * latitude = [dict objectForKey:@"latitude"];
        if (latitude != nil) {
            theRestaurant.restLatitude = latitude;
        } else {
            theRestaurant.restLatitude = [NSNumber numberWithInteger:0];
            NSLog(@"I could not parse the restaurant latitude");
        }
        
        NSNumber * longitude = [dict objectForKey:@"longitude"];
        if (longitude != nil) {
            theRestaurant.restLongitude = longitude;
        } else {
            theRestaurant.restLongitude = [NSNumber numberWithInteger:0];
            NSLog(@"I could not parse the restaurant longitude");
        }
        
        NSString * menuName = [dict objectForKey:@"menuName"];
        if (menuName != nil) {
            theRestaurant.restMenu = menuName;
        } else {
            theRestaurant.restMenu = @"";
            NSLog(@"I could not parse the restaurant menu");
        }
        
        NSArray * dishArray = [dict objectForKey:@"dishes"];
        
        for (NSDictionary *dishesDict in dishArray) {
            
            Dishes * theDish = [[Dishes alloc] init];
            
            NSString * dishName = [dishesDict objectForKey:@"name"];
            if (dishName != nil) {
                theDish.dishName = dishName;
            } else {
                theDish.dishName = @"";
                NSLog(@"I could not parse the dish name");
            }
            
            NSString * dishDesc = [dishesDict objectForKey:@"description"];
            if (dishDesc != nil) {
                theDish.dishDescription = dishDesc;
            } else {
                theDish.dishDescription = @"";
                NSLog(@"I could not parse the dish description");
            }
            
            NSString * dishImage = [dishesDict objectForKey:@"imageNameString"];
            if (dishImage != nil) {
                theDish.imageNameString = dishImage;
            } else {
                theDish.imageNameString = @"";
                NSLog(@"I could not parse the dish image string");
            }
            
            NSNumber * dishRating = [dishesDict objectForKey:@"rating"];
            if (dishRating != nil) {
                theDish.dishRating = dishRating;
            } else {
                theDish.dishRating = [NSNumber numberWithInteger:0];
                NSLog(@"I could not parse the dish rating");
            }
            
            NSNumber * dishPrice = [dishesDict objectForKey:@"price"];
            if (dishPrice != nil) {
                theDish.dishPrice = dishPrice;
            } else {
                theDish.dishPrice = [NSNumber numberWithInteger:0];
                NSLog(@"I could not parse the dish price");
            }
            
            [theRestaurant.dishesArray addObject:theDish];
        } [self.restaurantArray addObject:theRestaurant];
    }
    
}

@end
