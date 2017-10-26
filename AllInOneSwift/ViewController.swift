//
//  ViewController.swift
//  AllInOneSwift
//
//  Created by Jeyabalaji T M on 5/8/17.
//  Copyright © 2017 Ant and Buffalo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var myData: Array<String> = [];
    var inProgress: Bool = false;
    
    @IBOutlet weak var myTable: UITableView!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let actualPosition: CGFloat = scrollView.contentOffset.y;
        let contentHeight: CGFloat = scrollView.contentSize.height - 1000;
        print("actual \(actualPosition) -- content - \(contentHeight)");
        if (actualPosition < 100) {
            inProgress = true;
            _ = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer) in
                if(self.inProgress) {
                    self.inProgress = false;
                    self.myData.insert("a", at: 0);
                    self.myData.insert("b", at: 0);
                    self.myTable.reloadData();
                    let indexPath = IndexPath(row: 1, section: 0);
                    self.myTable.scrollToRow(at: indexPath, at: .top, animated: true);
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell")!;
        cell.textLabel?.text = myData[indexPath.row];
        return cell;
    }
    
    
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
        myTable.dataSource = self;
        myTable.delegate = self;
        
        readDataFromPlist();
        
        for i in 1...20 {
            myData.append(String(i));
        }
        print(myData);
        myTable.reloadData();
        let indexPath = IndexPath(row: myData.count - 1, section: 0);
        self.myTable.scrollToRow(at: indexPath, at: .bottom, animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

