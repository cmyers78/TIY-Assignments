//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


func hello(name:String) -> String {
    return ("Hello \(name)")
}

func hello(names:String) -> (Int, String) {
    return (names.count, names.reduce("Hello, ") {$0 + "\n" + $1})
}

hello("My Friend")

//: [Next](@next)
