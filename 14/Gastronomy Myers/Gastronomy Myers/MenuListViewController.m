//
//  MenuListViewController.m
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "MenuListViewController.h"
#import "Restaurant.h"
#import "Dishes.h"
#import "RestaurantListViewController.h"
#import "DishTableViewCell.h"
#import "RestaurantTableViewCell.h"


@interface MenuListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Dishes * menuDish;
@property (strong, nonatomic) NSMutableArray * theDishArray;

@end

@implementation MenuListViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.theRestaurant.dishesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DishTableViewCell * dishCell = (DishTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"dishCell" forIndexPath:indexPath];
    
    self.menuDish = [self.theRestaurant.dishesArray objectAtIndex:indexPath.row];
    
    dishCell.dishNameLabel.text = self.menuDish.dishName;
    dishCell.dishDescLabel.text = self.menuDish.dishDescription;
    
    dishCell.dishPriceLabel.text = [NSString stringWithFormat:@"$%@", self.menuDish.dishPrice];
    
    
    dishCell.dishRatingLabel.text = [NSString stringWithFormat:@"Rating: %@", self.menuDish.dishRating];
    dishCell.dishListImage.image = [UIImage imageNamed:self.menuDish.imageNameString];
    
    return dishCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
