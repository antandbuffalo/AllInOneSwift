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
    var counter: Int = 0;
    @IBOutlet weak var myTable: UITableView!
    
    func insertRows() {
        var indexPaths: Array<IndexPath> = [];
        for i in 0...10 {
            //indexPaths.append(IndexPath(row: i, section: 0));
            self.myData.insert("a" + String(describing: i), at: 0);
            myTable.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.none);
        }
    }
    func insertLoading() {
        self.myData.insert("Loading...", at: 0);
        let indexPath = IndexPath(row: 0, section: 0);
        myTable.insertRows(at: [indexPath], with: UITableViewRowAnimation.none);
    }
    func deleteLoading()  {
        myData.remove(at: 0);
        let indexPath = IndexPath(row: 0, section: 0);
        myTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic);
    }
    func insertAndReload() {
        for i in 0...10 {
            let newElem = "a" + String(describing: i);
            //self.myData.append(newElem);
            self.myData.insert(newElem, at: 0);
            let currentIndexPath = IndexPath(row: 11, section: 0);
            self.myTable.reloadData();
            myTable.scrollToRow(at: currentIndexPath, at: UITableViewScrollPosition.top, animated: false);
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let actualPosition: CGFloat = scrollView.contentOffset.y;
        let contentHeight: CGFloat = scrollView.contentSize.height;
        print("actual \(actualPosition) -- content - \(contentHeight)");
        if (actualPosition < 10 && !inProgress) {
            inProgress = true;
            insertLoading();
            _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
                if(self.inProgress) {
                    self.inProgress = false;
                    //self.myTable.scrollToRow(at: IndexPath(row: 1, section: 0), at: .top, animated: false);
                    self.deleteLoading();
                    self.insertAndReload();
                    
                    //self.insertRows();
                    
                    //self.myTable.reloadData();
                    //let indexPath = IndexPath(row: 11, section: 0);
                    //self.myTable.scrollToRow(at: indexPath, at: .top, animated: false);
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell")!;
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

