//
//  MoviesTableViewController.swift
//  MoviesListSwift
//
//  Created by Christopher Myers on 6/15/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var moviesArray = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parseData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.moviesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)
        
        let currentMovie = self.moviesArray[indexPath.row]
        
        if let imageURL = NSURL(string: currentMovie.posterPath) {
            if let data = NSData(contentsOfURL: imageURL) {
                
                cell.imageView?.image = UIImage(data: data)
            }
        }
        
        cell.textLabel?.text = currentMovie.movieTitle
       // cell.imageView?.image = UIImage (named: currentMovie.posterPath)
        
        return cell
    }

  
    func parseData() {
        // 1. create type alias
        typealias JSONDictionary = [String:AnyObject]
        typealias JSONArray = [JSONDictionary]
        
        // 2. get json data as NSURL
        if let filePath = NSBundle.mainBundle().URLForResource("popular", withExtension: "json") {
        // 3. create data object & pass the url to it
            if let data = NSData(contentsOfURL: filePath) {
                
                do {
        // 4. create a dictionary of the data and cast it as the JSONDictionary typealias
                    if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                        
        // 5. create a results array from the jsonDict.  It is cast as a JSONArray
                        if let resultsArray = jsonDict["results"] as? JSONArray {
                            print(jsonDict)
                            
                            for resultsDict in resultsArray {
                                
                                let theMovie = Movie()
                                
                                if let posterPath = resultsDict["poster_path"] as? String {
                                    //print(posterPath)
                                    
                                    theMovie.posterPath = "http://image.tmdb.org/t/p/w500\(posterPath)"
                                    
                                } else {
                                    print("I couldn't parse the poster path")
                                }
                                
                                if let adult = resultsDict["adult"] as? Bool {
                                    theMovie.adultRated = adult
                                } else {
                                    print("I could parse the adult rating")
                                }
                                if let overview = resultsDict["overview"] as? String {
                                    theMovie.overview = overview
                                } else {
                                    print("i couldnt parse the overview")
                                }
                                if let releaseDate = resultsDict["release_date"] as? String {
                                    theMovie.releaseDate = releaseDate
                                } else {
                                    print("I couldn't parse the release date")
                                }
                                if let id = resultsDict["id"] as? Double {
                                    theMovie.id = id
                                } else {
                                    print("I couldn't parse the id")
                                }
                                if let originalTitle = resultsDict["original_title"] as? String {
                                    theMovie.originalTitle = originalTitle
                                } else {
                                    print("I couldn't parse the original title")
                                }
                                if let originalLanguage = resultsDict["original_language"] as? String {
                                    theMovie.originalLanguage = originalLanguage
                                } else {
                                    print("I couldn't parse the original language")
                                }
                                if let movieTitle = resultsDict["title"] as? String {
                                    theMovie.movieTitle = movieTitle
                                } else {
                                    print("I could not parse the title")
                                }
                                if let backdropPath = resultsDict["backdrop_path"] as? String {
                                    theMovie.backDropPath = backdropPath
                                } else {
                                    print("I could not parse the backdrop path")
                                }
                                if let popularity = resultsDict["popularity"] as? Double {
                                    theMovie.popularity = popularity
                                } else {
                                    print("I could not parse the popularity")
                                }
                                if let voteCount = resultsDict["vote_count"] as? Double {
                                    theMovie.voteCount = voteCount
                                } else {
                                    print("I could not parse the vote counts")
                                }
                                if let video = resultsDict["video"] as? Bool {
                                    theMovie.hasVideo = video
                                } else {
                                    print("I could not parse the video")
                                }
                                if let voteAverage = resultsDict["vote_average"] as? Double {
                                    theMovie.avgVote = voteAverage
                                } else {
                                    print(" I could not parse the average vote")
                                }
                               self.moviesArray.append(theMovie)
                            }
                        } else {
                            print ("I could not parse the dictionary")
                        }
                        
                    }
                    
                } catch {
                    print (" I could not parse the data")
                }
            }
        }
    }
}
