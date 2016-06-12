//
//  DishTableViewCell.h
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/12/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DishTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dishListImage;
@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishRatingLabel;

@end
