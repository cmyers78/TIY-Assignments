//
//  ViewController.m
//  Method Acting
//
//  Created by Christopher Myers on 5/25/16.
//  Copyright © 2016 DragomanDevelopers, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self printGreeting:@"Methods are fun"];
    [self printGreetingToo:@"Woodrow" atTimeOfDay:@"Evening"];
    
    NSString *greeting1 = [self greetingWithName:@"Lily Elizabeth"];
    NSLog(@"%@", greeting1);
    
    NSString *greeting2 = [self greetingWithFullName:@"Steve Jobs"];
    NSLog(@"%@", greeting2);
    
    NSString *greeting3 = [self greetingAtTimeOfDay:@"Afternoon"];
    NSLog(@"%@", greeting3);
    
    NSString *greeting4 = [self greetingWithBand:@"Sturgill Simpson" withOpeningBand:@"First Aid Kit"];
    NSLog(@"%@", greeting4);
    
    NSString *greeting5 = [self stringWithName:@"Chris" age: 37];
    NSLog(@"%@", greeting5);
    
    NSString *greeting6 = [self stringWithBand:@"Mouse Rat" withLeadSinger:@"Andy Dwyer" withBassPlayer:@"Berry Oakley"];
    NSLog(@"%@", greeting6);

}

-(void)printGreeting:(NSString *) greeting {
    NSLog (@"Your greeting of the day is: %@", greeting);
}

-(void)printGreetingToo:(NSString *) name atTimeOfDay:(NSString *) timeOfDayString {
    NSLog(@"Hello %@. Hope you have a great %@", name, timeOfDayString);
    
}

-(NSString *) greetingWithName: (NSString *) name {
    return [NSString stringWithFormat:@"Hello %@", name];
    
}

-(NSString *) greetingWithFullName: (NSString *) fullName {
    return [NSString stringWithFormat:@"Good afternoon %@.  Welcome to Earth.", fullName];
}


-(NSString *) greetingAtTimeOfDay: (NSString *) timeOfDay {
    return [NSString stringWithFormat:@"Good %@! Are you hungry? Sleepy? Thirsty?", timeOfDay];
}

-(NSString *) greetingWithBand: (NSString *) bandName withOpeningBand:(NSString *) openBand {
    return [NSString stringWithFormat:@"Tonight Only! Welcome %@ with opening act %@!", bandName, openBand];
}

-(NSString *) stringWithName: (NSString *) name age:(float) age {
    return [NSString stringWithFormat:@"My name is %@ and I am %0.0f years old", name, age];
}
-(NSString *) stringWithBand: (NSString *) bandName withLeadSinger:(NSString*) leadSinger withBassPlayer: (NSString *) bassPlayer {
    return [NSString stringWithFormat:@"Ladies & Gentleman.  Introducing %@!  On lead vocals: %@ with %@ on bass!", bandName, leadSinger, bassPlayer];
}
@end
