//
//  ViewController.swift
//  WelcomeAgentSwift - Myers
//
//  Created by Christopher Myers on 6/13/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var agentNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    let agentName = "Chris Myers"
    let password = "1234"
    var agentList = [ ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func authenticate() {
        if self.agentNameText.text == agentName && self.passwordText.text == password {
            self.view.backgroundColor = UIColor(red: 107/255, green: 142/255, blue: 35/255, alpha: 1)
            
            agentList = agentName.componentsSeparatedByString(" ")
            self.welcomeLabel.text = "ACCESS GRANTED AGENT \(agentList[1])"
            
        } else {
            self.view.backgroundColor = UIColor(red: 222/255, green: 15/255, blue: 15/255, alpha: 1)
            self.welcomeLabel.text = "DENIED"
        }
    }
    // MARK: UITextFieldDelegate Function
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == agentNameText {
            passwordText.becomeFirstResponder()
        } else {
        
        textField.resignFirstResponder()
        }
        return true
    }
    
    // MARK: Action Function
    @IBAction func authenticatePressed(sender: UIButton) {
        authenticate()
        
    }
}

