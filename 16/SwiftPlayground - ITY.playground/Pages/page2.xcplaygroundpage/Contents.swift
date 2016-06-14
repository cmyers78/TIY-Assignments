//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func hello(peopleNamed people: String...) {
    if people .isEmpty {
        hello(peopleNamed: "World")
    }
    
    for person in people {
        print("Hello \(person)")
    }
}

hello(peopleNamed: "Chris", "Joe", "Phil", "Jason", "Taylor")
hello()

//: [Next](@next)
