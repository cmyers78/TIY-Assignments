//
//  StarWarsTableViewController.swift
//  StarWarsTable-Myers
//
//  Created by Christopher Myers on 6/15/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class StarWarsTableViewController: UITableViewController {

    var starWarsArray = [swCharacter]()
    
    
    
//    let starWarsArray = ["Obi Wan Kenobi", "Princess Leia", "R2D2", "Luke Skywalker", "Grand Moff Tarkin", "Darth Vader"]
//    
//    let starWarsImagesArray = ["kenobi", "organa", "r2", "skywalker", "tarkin", "vader"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.starWarsArray.append(swCharacter(instanceName: "Darth Vader", instanceImage: "vader"))
        self.starWarsArray.append(swCharacter(instanceName: "Obi Wan Kenobi", instanceImage: "kenobi"))
        self.starWarsArray.append(swCharacter(instanceName: "Grand Moff Tarkin", instanceImage: "tarkin"))
        self.starWarsArray.append(swCharacter(instanceName: "Luke Skywalker", instanceImage: "skywalker"))
        self.starWarsArray.append(swCharacter(instanceName: "R2D2", instanceImage: "r2"))
        self.starWarsArray.append(swCharacter(instanceName: "Princess Leia", instanceImage: "organa"))
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.starWarsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StarWarsTableViewCell
        
        let character = self.starWarsArray[indexPath.row]
        
        cell.characterLabel?.text = character.name
        cell.starWarsImageView?.image = UIImage (named: character.imageName)

        return cell
    }
 

}
