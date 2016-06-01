//
//  ViewController.m
//  StarWarsCharactersMyers
//
//  Created by Christopher Myers on 5/31/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "ViewController.h"
#import "SWCharacterCreation.h"
#import "CharacterDetailViewController.h"



@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *characterArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) SWCharacterCreation *currentCharacter;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.characterArray = [[NSMutableArray alloc] init];
    
    // creates a new SW Character object
    SWCharacterCreation *han = [[SWCharacterCreation alloc] initWithName:@"Han Solo" spacecraft:@"Millennium Falcon"];
    
    // adds the object to the array
    [self.characterArray addObject:han];
    
    SWCharacterCreation *luke = [[SWCharacterCreation alloc] initWithName:@"Luke Skywalker" spacecraft:@"X-Wing"];
    [self.characterArray addObject:luke];
    
    SWCharacterCreation *leia = [[SWCharacterCreation alloc] initWithName:@"Princess Leia" spacecraft:@"Alderann Cruiser"];
    [self.characterArray addObject:leia];
    
    SWCharacterCreation *c3po = [[SWCharacterCreation alloc] initWithName:@"C3PO" spacecraft:@"Coruscant Air Taxi"];
    [self.characterArray addObject:c3po];
    
    SWCharacterCreation *r2d2 = [[SWCharacterCreation alloc] initWithName:@"R2-D2" spacecraft:@"Jedi Starfighter"];
    [self.characterArray addObject:r2d2];
    
    SWCharacterCreation *chewie = [[SWCharacterCreation alloc] initWithName:@"Chewbacca" spacecraft:@"Havoc Marauder"];
    [self.characterArray addObject:chewie];
    
    SWCharacterCreation *obi = [[SWCharacterCreation alloc] initWithName:@"Obi Wan Kenobi" spacecraft:@"Freeco Bike"];
    [self.characterArray addObject:obi];
    
    SWCharacterCreation *darth = [[SWCharacterCreation alloc] initWithName:@"Darth Vader" spacecraft:@"TIE Fighter"];
    [self.characterArray addObject:darth];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [self.characterArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"StarWarsCell" forIndexPath:indexPath];
    
    // takes an object an pulls it out of the array
    self.currentCharacter = [self.characterArray objectAtIndex:indexPath.row];
    
    // takes the object pulled out and asks for its name property
    cell.textLabel.text = self.currentCharacter.name;
    
    
    return cell;
    
}

// allows 
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"I clicked on row %ld", (long)indexPath.row);
    
    self.currentCharacter = [self.characterArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"segueToInfo" sender:self];
    

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   // NSLog (@"Prepare for Segue called with identifier == %@", segue.identifier);
    
    if ([segue.identifier isEqualToString:@"segueToInfo"]) {
        
        
        // This gives you a pointer to the upcoming destination View Controller
        // theCharacter is created in the 2nd view controllers
        // this code below links our currentCharacter object (and info) to
        // the new "theCharacter" object created on the 2nd view controller
        // both currentCharacter and theCharacter must pull their information from
        // SWCharacterCreation file
        
        CharacterDetailViewController *viewController = (CharacterDetailViewController *) segue.destinationViewController;
        viewController.theCharacter = self.currentCharacter;
        
    }
}

@end