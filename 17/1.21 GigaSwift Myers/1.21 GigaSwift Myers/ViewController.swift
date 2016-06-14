//
//  ViewController.swift
//  1.21 GigaSwift Myers
//
//  Created by Christopher Myers on 6/14/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enterDestination: UITextField!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var currentSpeed: UILabel!
    
    // created date formatter
    let formattedDate = NSDateFormatter()
    
    // create global variable to use in any function
    var milesPerHour = 0
    var timer:NSTimer?

    override func viewDidLoad() {
        // create a date formatter and setting the format
        // grab today's date
        // update the present time label to today's date (involves changing
        // NSDate object to a string)
        super.viewDidLoad()
        self.formattedDate.dateFormat = "MMM d, yyyy"
        let today : NSDate = NSDate()
        //print(today)
        self.presentTime.text = self.formattedDate.stringFromDate(today)
    
    }
    
    func enteredDate()   {
        
        // grab the date from the entered date text box
        // use the formatter to take it from mmddyyyy to MM d, yyyy
        // update the entered Destination label
        
        self.formattedDate.dateFormat = "MMddyyyy"
        
        // use if statement to make sure that something exists inside the variable
        // thanks so much stupid optionals!
        
        if let dateEntered = self.enterDestination.text {
            
            if let theDate = self.formattedDate.dateFromString(dateEntered) {
        
                self.formattedDate.dateFormat = "MMM d, yyyy"
                self.enterDestination.text = self.formattedDate.stringFromDate(theDate)
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        enteredDate()
        self.enterDestination.resignFirstResponder()
        
        return true
    }

    
    func updateMiles() {
        self.milesPerHour += 1
        if milesPerHour == 88 {
            self.timer?.invalidate()
            self.performSegueWithIdentifier("popupSegue", sender: self)
        }
            self.currentSpeed.text = "\(milesPerHour) MPH"
        
    }
    
    func reset() {
        self.lastTimeDeparted.text = "--- -- ----"
        self.enterDestination.text = ""
        self.currentSpeed.text = "0 MPH"
        milesPerHour = 0
    }
    
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
    reset()
    }
    
    // update current speed label
    // this involves creating a timer that will count for us
    // can be in either a function called update timer
    // or in the button action. We're doing it in the button
    
    
    @IBAction func travelBackPressed(sender: UIButton) {
        self.lastTimeDeparted.text = self.presentTime.text
        self.milesPerHour = 0
        let speed = 0.1
        
         self.timer = NSTimer.scheduledTimerWithTimeInterval(speed, target: self, selector: #selector(updateMiles), userInfo: nil, repeats: true);
        
    }


}

