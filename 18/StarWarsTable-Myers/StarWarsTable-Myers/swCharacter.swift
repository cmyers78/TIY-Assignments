//
//  swCharacter.swift
//  StarWarsTable-Myers
//
//  Created by Christopher Myers on 6/15/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import Foundation

struct swCharacter {
    
    var name: String
    var imageName: String
    
    init(instanceName: String, instanceImage: String) {
        
        self.name = instanceName
        self.imageName = instanceImage
        
    }
}