//
//  ScndViewController.swift
//  d09
//
//  Created by Martin SIREAU on 10/14/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit

class ScndViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var arr = ["lol", "lol", "lol"]
    @IBOutlet weak var myTableVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Articles"
        //access to core data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "myCell")
        
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
}
