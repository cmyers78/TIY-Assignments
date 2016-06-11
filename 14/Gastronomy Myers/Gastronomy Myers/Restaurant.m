//
//  Restaurant.m
//  Gastronomy Myers
//
//  Created by Christopher Myers on 6/11/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant


-(instancetype) init {
    if ((self = [super init])) {
        self.dishesArray = [[NSMutableArray alloc] init];
    }
    return self;
    
}

@end
