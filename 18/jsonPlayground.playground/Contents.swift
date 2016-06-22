//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"


// 1. create your type alias

typealias JSONDictionary = [String:AnyObject]
typealias JSONArray = [JSONDictionary]

class Movie {
    
    var title: String = ""
    var posterPath: String = ""
    
    init() {
        self.title = ""
        self.posterPath = ""
        
    }
    
    init(title: String, posterPath: String) {
        self.title = title
        self.posterPath = posterPath
        
    }
}

var moviesArray = [Movie]()

// load the json file into NSURL

if let filePath = NSBundle.mainBundle().URLForResource("popular", withExtension: "json"){
    // 3. load the NSData from the file
    if let data = NSData(contentsOfURL: filePath) {
        do {
            if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                
                if let resultsArray = jsonDict["results"] as? JSONArray {
                    //print(jsonDict)
                    
                    for resultsDict in resultsArray {
                        
                        var theMovie = Movie()
                        
                        // print(resultsDict["poster_path"])
                        
                        if let posterPath = resultsDict["poster_path"] as? String {
                            print(posterPath)
                            
                            theMovie.posterPath = posterPath
                            
                        } else {
                            print("I couldn't parse the poster path")
                        }
                        
                        if let title = resultsDict["original_title"] as? String {
                            print(title)
                            theMovie.title = title
                            
                        } else {
                            print("I couldnt parse the title")
                        }
                        
                        moviesArray.append(theMovie)
                    }
                    
                    
                }  else {
                    print("i can't parse dicitonary")
                }
                
            }
            
        
        } catch {
            print("I could not parse the json data")
        }
    }
        // 4. convert data to nsstring
        


} else {
    print("could not load file")
}
print(moviesArray.count)

for theMovie in moviesArray {
    print(theMovie.title)
}
