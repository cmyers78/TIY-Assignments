//
//  MenuListViewController.h
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"
#import "Dishes.h"
#import "RestaurantListViewController.h"
#import "DishTableViewCell.h"
#import "RestaurantTableViewCell.h"

@interface MenuListViewController : UIViewController

@property (strong, nonatomic) Restaurant *theRestaurant;



@end
