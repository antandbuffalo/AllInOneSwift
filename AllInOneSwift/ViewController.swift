//
//  ViewController.swift
//  AllInOneSwift
//
//  Created by Jeyabalaji T M on 5/8/17.
//  Copyright © 2017 Ant and Buffalo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func readDataFromPlist() {
        var name: String;
        if let path = Bundle.main.path(forResource: "SampleData", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            // use swift dictionary as normal
            print(dict);
            
//            if let innerDic = dict["sampleDic"] as? [String: AnyObject] {
//                print("inner dic \(innerDic)");
//            }
            if let innerArray:Array<AnyObject> = dict["sampleArray"] as? Array {
                //print(innerArray);
                for item in innerArray {
                    print(item["name"]);
                    //name = item["name"]
                    if let name = item["name"] as? String {
                        print(name);
                    }
                }
            }
        }
        else {
            print("something is null");
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        readDataFromPlist();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

