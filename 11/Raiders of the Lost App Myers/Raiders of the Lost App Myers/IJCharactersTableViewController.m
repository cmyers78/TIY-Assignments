//
//  IJCharactersTableViewController.m
//  Raiders of the Lost App Myers
//
//  Created by Christopher Myers on 6/6/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "IJCharactersTableViewController.h"
#import "Characters.h"

@interface IJCharactersTableViewController ()

@property (strong, nonatomic) NSMutableArray * resultsArray;
@property (strong, nonatomic) Characters * currentCharacter;

@end

@implementation IJCharactersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultsArray = [[NSMutableArray alloc] init];
    
    [self parseJSON];
    
}
#pragma mark - Helper methods

- (void) parseJSON {
    // 1. Load JSON string from file
    NSString * jsonString = [self stringFromJSONFile];
    
    // 2. Convert the JSON String into an NSData format
    NSData * data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    // 3. Create an NSError - named nil
    NSError * error = nil;
    
    // 4. Parse the data file into an NSDictionary
    NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    // we're set up to parse the json data
    // if no errors, parse, if there are errors, display error message
    
    if (error == nil) {
        
        //NSLog(@"json Dictionary == %@", jsonDictionary);
        
        NSArray * array = [jsonDictionary objectForKey:@"characters"];
        
        for (NSDictionary * dict in array) {
            
            Characters * theCharacter = [[Characters alloc] init];
            
            NSString * characterName = [dict objectForKey:@"name"];
            if (characterName != nil) {
                theCharacter.characterName = characterName;
            } else {
                theCharacter.characterName = @"";
                NSLog(@"I could not parse the character name");
            }
            
            NSString * healthStatus = [dict objectForKey:@"status"];
            if (healthStatus != nil)  {
                theCharacter.healthStatus = healthStatus;
            } else {
                theCharacter.characterName = @"";
                NSLog(@"I could not parse the health status");
            }
            
            NSString * movieAppeared = [dict objectForKey:@"movieAppeared"];
            if (movieAppeared != nil) {
                theCharacter.movieAppeared = movieAppeared;
            } else {
                theCharacter.movieAppeared = @"";
                NSLog(@"I could not parse the movie appeared status");
            }
            
            [self.resultsArray addObject:theCharacter];
            
        }
        NSLog(@"Post count == %ld", self.resultsArray.count);
        
    }

}

-(NSString *) stringFromJSONFile {
    
    // 1. Create an allocate an empty string
    NSString * str = [[NSString alloc] init]; //could also use NSString *str = @"";
    
    // 2. Get the main bundle ??? what is a bundle again ???
    NSBundle * mainBundle = [NSBundle mainBundle];
    
    // 3. Get the string for the file path - 2 steps
    
    NSString * filePath = [mainBundle pathForResource:@"rotlapp" ofType:@"json"];
    NSString * jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    // 4. Verify that it is a valid string
    if (jsonString != nil) {
        str = jsonString;
    }
    //NSLog(@"%@", jsonString);
    
    return str;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.resultsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    self.currentCharacter = [self.resultsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = self.currentCharacter.characterName;
    cell.detailTextLabel.text = self.currentCharacter.healthStatus;
    
    
    return cell;
}





    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
