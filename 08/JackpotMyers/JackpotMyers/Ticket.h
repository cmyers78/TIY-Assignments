//
//  Ticket.h
//  JackpotMyers
//
//  Created by Christopher Myers on 6/1/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

-(instancetype) initWithName:(NSString *)firstName lastName:(NSString *) lastName lottoTicket:(NSString *)lottoTicket;


@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * lastName;
@property (strong, nonatomic) NSString * lottoTicket;


@end
