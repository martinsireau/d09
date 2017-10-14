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

    var arr = [Article]()
    @IBOutlet weak var myTableVC: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var articleManager : ArticleManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Articles"
        articleManager = ArticleManager(managedObjectContext: self.context)

        if let allArticles = articleManager?.getAllArticles(){
            arr = allArticles
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ArticleTableViewCell = self.myTableVC.dequeueReusableCell(withIdentifier: "myCell") as! ArticleTableViewCell
        
        cell.myTitle.text = arr[indexPath.row].title
        cell.contentLabel.text = arr[indexPath.row].content
        cell.creationLabel.text = String(describing: arr[indexPath.row].creationDate!)
        cell.modificationLabel.text =  String(describing: arr[indexPath.row].modificationDate!)

        return cell
    }
    
    @IBAction func addArticle(_ sender: Any) {
        
//        if let article1 = articleManager?.newArticle(){
//            article1.title = "ljkdhglkjad"
//            article1.content = "Le Meilleur Kebab desdfalsjkdfkljasdf paname"
//            article1.creationDate = NSDate()
//            article1.modificationDate = NSDate()
//            article1.langage = "fr"
//        }
//        
//        articleManager?.save()
//        
//        if let article2 = articleManager?.newArticle(){
//            article2.title = "istanbul kebsadfasdfasdfab"
//            article2.content = "The worst kebab on earsadfasdfasdfasdfth"
//            article2.creationDate = NSDate()
//            article2.modificationDate = NSDate()
//            article2.langage = "en"
//        }
//        articleManager?.save()
//        arr = (articleManager?.getAllArticles())!
//        myTableVC.reloadData()
    }
}
