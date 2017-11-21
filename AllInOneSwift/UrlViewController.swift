//
//  UrlViewController.swift
//  AllInOneSwift
//
//  Created by Jeyabalaji T M on 15/11/17.
//  Copyright © 2017 Ant and Buffalo. All rights reserved.
//

import UIKit

class UrlViewController: UIViewController {

    @IBOutlet weak var lblStatus: UILabel!
    
    
    func sendUrlRequest() {
        let url = URL(string: "https://www.stackoverflow.com1")
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
//            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
            if let httpResponse = response as? HTTPURLResponse {
                
                print("error \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
    }
    
    func readPlist() {
        if let path = Bundle.main.path(forResource: "Servers", ofType: "plist") {
            
            //If your plist contain root as Array
//            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
//
//            }
            
            ////If your plist contain root as Dictionary
            if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
                print(dic);
                if let sin = dic["sin"] as? [String: Any] {
                    print(sin["sit"]!);
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sendUrlRequest();
        readPlist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
