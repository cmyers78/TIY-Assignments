//
//  Album.h
//  Artists Albums Myers
//
//  Created by Christopher Myers on 6/7/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

-(instancetype) initWithDictionary:(NSDictionary *) dict;


@property (strong, nonatomic) NSString * albumName;
@property (strong, nonatomic) NSString * albumID;

@property (nonatomic,strong) NSString *url640String;
@property (nonatomic,strong) NSString *url320String;
@property (nonatomic,strong) NSString *thumbnailURLString;



@end
