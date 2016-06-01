//
//  CharacterDetailViewController.m
//  StarWarsCharactersMyers
//
//  Created by Christopher Myers on 5/31/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "CharacterDetailViewController.h"
#import "SWCharacterCreation.h"


@interface CharacterDetailViewController ()

//@property (strong, nonatomic) SWCharacterCreation * theCharacter;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *spacecraftLabel;


@end

@implementation CharacterDetailViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    

    self.nameLabel.text = self.theCharacter.name;
    self.spacecraftLabel.text = self.theCharacter.spacecraft;
    
    
}


@end
