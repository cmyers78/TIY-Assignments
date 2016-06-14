//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str
print(str)

//func hello () {
//    hello("World")
//}

//func hello(name: String = "World") {
//    print("Hello, \(name)!")
//    
//}

func hello(name: String = "World", numberOfTimes: Int = 1) //  parameters are optional..not required we can 1 or all of them
{
    for _ in 1...numberOfTimes {
        print("Hello \(name)")
    }
}
hello()
hello("Swift Programmer")
hello("Swift 2 Adopter", numberOfTimes: 3)
hello(numberOfTimes: 2)
