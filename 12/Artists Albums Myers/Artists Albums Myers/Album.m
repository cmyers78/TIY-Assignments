//
//  Album.m
//  Artists Albums Myers
//
//  Created by Christopher Myers on 6/7/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

#import "Album.h"

@implementation Album

// need to take notes on this
// this function allows new objects to be created.
// the object is given a placeholder name of self
-(instancetype) initWithDictionary:(NSDictionary *)dict {
    
    if ( (self = [super init])) {
        
        // looks into the data file under "name" and assigns it to the
        // albumName property.  albumID does the same thing.
        // this data comes from parsing json file method
        // in the AlbumsViewController
        
        self.albumName = [dict valueForKey:@"name"];
        
        self.albumID = [dict valueForKey:@"id"];
        
        // creates an array assigned to the json dictionary
        // called "images".  That dictionary sits inside
        // of an array, hence the need for an array
        
        NSArray * imagesArray = [dict valueForKey:@"images"];
        NSLog (@"images array look like....%@", imagesArray);
        
        // only runs if the array returns three strings
        if (imagesArray.count == 3) {
            
            // need to talk through this one more
            
            NSDictionary * firstDict = [imagesArray objectAtIndex:0];
            NSDictionary * secondDict = [imagesArray objectAtIndex:1];
            NSDictionary * thirdDict = [imagesArray objectAtIndex:2];
            
            self.url640String = [firstDict valueForKey:@"url"];
            self.url320String = [secondDict valueForKey:@"url"];
            self.thumbnailURLString = [thirdDict valueForKey:@"url"];
            
            
        }
        
    }
    
    
    return self;
}

@end
