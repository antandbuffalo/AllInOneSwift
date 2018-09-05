//
//  SimpleTextEditor.swift
//  AllInOneSwift
//
//  Created by developer1 Jeyabalaji on 5/9/18.
//  Copyright © 2018 Ant and Buffalo. All rights reserved.
//

import Foundation

class SimpleTextEditor: NSObject {
    var myStack = [String]()
    
    enum Operation: Int {
        case append = 1, delete, print, undo
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
}
