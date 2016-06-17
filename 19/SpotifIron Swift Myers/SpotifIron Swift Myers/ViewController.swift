//
//  ViewController.swift
//  SpotifIron Swift Myers
//
//  Created by Christopher Myers on 6/16/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let session = NSURLSession.sharedSession()
    
    var artistArray = [Artist]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK : Grab text and implement parsing method
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == textFieldOutlet {
        
        textField.resignFirstResponder()
        }
        fetchArtist(self.textFieldOutlet.text!)
        return true
        
    }
    
    
    // MARK : Table View Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.artistArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView .dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let currentArtist = self.artistArray[indexPath.row]
        
        cell.textLabel?.text = currentArtist.name
        
        return cell
    }
    
    
    
    
    // MARk: Parsing Method
    
    func fetchArtist (query : String) {
        
        let artistURLString = "https://api.spotify.com/v1/search?q=\(query)&type=artist"
        
        if let url = NSURL(string: artistURLString)
        {
            let task = self.session.dataTaskWithURL(url, completionHandler:
            {
                (data, response, error) in
                
                if error != nil
                {
                    print("An error occured")
                    return
                }
                
                do
                {
                    if let data = data {
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                            
                            if let artistDict = dict["artists"] as? JSONDictionary {
                                
                                if let itemsArray = artistDict["items"] as? JSONArray {
                                    
                                    for itemsDict in itemsArray  {
                                        
                                        let theArtist = Artist()
                                        
                                        if let name = itemsDict["name"] as? String {
                                            theArtist.name = name
                                            
                                            
                                        } else {
                                            print("I could not parse the name")
                                        }
                                        
                                       self.artistArray.append(theArtist)
                                    }
                                } else {
                                    print("I could not parse the items")
                                }
                            } else {
                                print ("I could not parse the artists")
                            }
                        } else {
                            print ("I could not parse the json dictionary")
                        }
                    }
                } catch {
                    // error happened
                }
                
            })
            task.resume()
            
        }
    }


}


