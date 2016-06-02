//
//  CheckTicketViewController.h
//  JackpotMyers
//
//  Created by Christopher Myers on 6/1/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@interface CheckTicketViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) Ticket * checkedTicket;
@property (strong, nonatomic) Ticket * winningTicketJP;
@end
