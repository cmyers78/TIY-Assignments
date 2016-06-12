//
//  RestaurantTableViewCell.h
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *restNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *restAddLabel;
@property (weak, nonatomic) IBOutlet UIImageView *restImage;
@property (weak, nonatomic) IBOutlet UILabel *restCSZLabel;

@end
