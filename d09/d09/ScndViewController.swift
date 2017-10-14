//
//  ScndViewController.swift
//  d09
//
//  Created by Martin SIREAU on 10/14/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit
import msireau2017

class ScndViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var arr = ["lol", "lol", "lol"]
    @IBOutlet weak var myTableVC: UITableView!
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Articles"
//        let articleManager = ArticleManager(managedObjectContext: self.context)

        //access to core data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ArticleTableViewCell = self.myTableVC.dequeueReusableCell(withIdentifier: "myCell") as! ArticleTableViewCell
        
        cell.myTitle.text = arr[indexPath.row]
        cell.contentLabel.text = arr[indexPath.row]
        cell.creationLabel.text = arr[indexPath.row]
        cell.modificationLabel.text = arr[indexPath.row]
        return cell
    }
}
