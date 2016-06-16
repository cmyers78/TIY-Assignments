//
//  Movie.swift
//  MoviesListSwift
//
//  Created by Christopher Myers on 6/15/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import Foundation

class Movie {
    
    var posterPath : String = ""
    var adultRated : Bool = false
    var overview : String = ""
    var releaseDate : String = ""
    var id : Double = 0
    var originalTitle : String = ""
    var originalLanguage : String = ""
    var movieTitle : String = ""
    var backDropPath : String = ""
    var popularity : Double = 0.0
    var voteCount : Double = 0
    var hasVideo : Bool = false
    var avgVote : Double = 0.0
    
    init () {
        self.posterPath = ""
        self.adultRated = false
        self.overview = ""
        self.releaseDate = ""
        self.id = 0
        self.originalTitle = ""
        self.originalLanguage = ""
        self.movieTitle = ""
        self.backDropPath = ""
        self.popularity = 0.0
        self.voteCount = 0
        self.hasVideo = false
        self.avgVote = 0.0
    }
    
    
    
}
