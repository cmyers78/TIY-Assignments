//
//  CharacterInit.m
//  StarWarsCharactersMyers
//
//  Created by Christopher Myers on 5/31/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "SWCharacterCreation.h"

@implementation SWCharacterCreation

-(instancetype) initWithName:(NSString *)name spacecraft:(NSString *)spacecraft {
    if (self = [super init]) {
        self.name = name;
        self.spacecraft = spacecraft;
    }
    
    return self;
}
//
//    CharacterInit *theCharacter = [[CharacterInit alloc] init];
//    theCharacter.name = name;
//    theCharacter.spacecraft = spacecraft;
//    
//    return theCharacter;


@end
