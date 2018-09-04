//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"

var myStack = [String]()

enum Operation: Int {
    case append = 1, delete, print, undo
}
//let noOfOperations = Int(readLine(strippingNewline: true)!)!
let noOfOperations = 0;
for _ in 0..<noOfOperations {
    let stringArray = readLine(strippingNewline: true)!.split {$0 == " "}.map (String.init)
    
}

func append1(myStack: inout [String], value: String) {
    
}

func delete1(myStack: inout [String]) {
    
}

func print1(myStack: inout [String]) {
    
}

func undo1(myStack: inout [String]) {
    
}

func doOperations(operationType: String, operationValue: String) {
    var myStack = [String]()
    if let type = Operation.init(rawValue: Int(operationType)!) {
        switch type {
        case .append:
            append1(myStack: &myStack, value: operationValue)
        case .delete:
            delete1(myStack: &myStack)
        case .print:
            print1(myStack: &myStack)
        case .undo:
            undo1(myStack: &myStack)
        }
    }
}
