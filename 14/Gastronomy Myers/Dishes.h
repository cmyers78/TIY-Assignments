//
//  Dishes.h
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/11/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dishes : NSObject

@property (strong, nonatomic) NSString * dishName;
@property (strong, nonatomic) NSString * dishDescription;
@property (strong, nonatomic) NSString * imageNameString;
@property (strong, nonatomic) NSNumber * dishPrice;
@property (strong, nonatomic) NSNumber * dishRating;


@end
