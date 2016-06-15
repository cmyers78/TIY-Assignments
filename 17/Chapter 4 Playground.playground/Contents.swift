//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let numbers = [0, 1, 2]

let three = numbers[1] + numbers[2]

let people = ["Swift Programmer", "Obj-C Old Timer"]

let morePeople : [String]

morePeople = ["Swift 2 Adopter", "Protocol Pro"]

func createGreetingWithSalutation(salutation: String) -> (String) -> String {
    func greetingFunction(name: String) -> String {
        let greeting = "\(salutation), \(name)!"
        return greeting
    }
    return greetingFunction
}

let greetings = [createGreetingWithSalutation("Hello"),
createGreetingWithSalutation("Bonjour"),
createGreetingWithSalutation("Hey")]
