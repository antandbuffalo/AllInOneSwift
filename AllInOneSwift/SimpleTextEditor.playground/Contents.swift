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

func append1(value: String) {
    var current = "";
    if let top = myStack.last {
        current = top;
    }
    current.append(value);
    myStack.append(current);
}

func delete1(index: Int) {
    guard var top = myStack.last else {
        return;
    }
    let newIndex = top.index(top.startIndex, offsetBy: index)
    top.remove(at: newIndex);
    myStack.append(top);
}

func print1(index: Int) {
    guard let top = myStack.last else {
        return;
    }
    let newIndex = top.index(top.startIndex, offsetBy: index)
    print(top[newIndex])
}

func undo1() {
    myStack.removeLast();
}

func doOperations(operationType: String, operationValue: String) {
    if let type = Operation.init(rawValue: Int(operationType)!) {
        switch type {
        case .append:
            append1(value: operationValue)
        case .delete:
            if let index = Int(operationValue) {
                delete1(index: index - 1);
            }
        case .print:
            if let index = Int(operationValue) {
                print1(index: index - 1);
            }
        case .undo:
            undo1()
        }
    }
}

//doOperations(operationType: "1", operationValue: "abc");
//doOperations(operationType: "3", operationValue: "3");
//doOperations(operationType: "2", operationValue: "3");
//doOperations(operationType: "1", operationValue: "xy");
//doOperations(operationType: "3", operationValue: "2");
