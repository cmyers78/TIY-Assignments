//
//  Ticket.m
//  JackpotMyers
//
//  Created by Christopher Myers on 6/1/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

-(instancetype) initWithName:(NSString *)firstName lastName:(NSString *)lastName lottoTicket:(NSString *)lottoTicket {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.lottoTicket = lottoTicket;
    }
    return self;
    
}
@end
