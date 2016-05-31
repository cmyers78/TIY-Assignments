//
//  CharacterInit.h
//  StarWarsCharactersMyers
//
//  Created by Christopher Myers on 5/31/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWCharacterCreation : NSObject

-(instancetype) initWithName:(NSString *) name spacecraft:(NSString *) spacecraft;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *spacecraft;


@end
