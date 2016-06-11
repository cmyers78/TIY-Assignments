//
//  Restaurant.h
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/11/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject


@property (strong, nonatomic) NSMutableArray * dishesArray;
@property (strong, nonatomic) NSString * restName;
@property (strong, nonatomic) NSString * restDescription;
@property (strong, nonatomic) NSString * restAddress;
@property (strong, nonatomic) NSString * restCity;
@property (strong, nonatomic) NSString * restState;
@property (strong, nonatomic) NSString * restZip;
@property (strong, nonatomic) NSString * restImageString;
@property (strong, nonatomic) NSString * restMenu;
@property (strong, nonatomic) NSNumber * restLatitude;
@property (strong, nonatomic) NSNumber * restLongitude;

@end
