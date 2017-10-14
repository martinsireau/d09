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

    override func viewWillAppear(_ animated: Bool) {
        arr = (articleManager?.getAllArticles())!
        myTableVC.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articleManager = ArticleManager(managedObjectContext: self.context)

        if let allArticles = articleManager?.getAllArticles(){
            arr = allArticles
        }
        myTableVC.rowHeight  = UITableViewAutomaticDimension
        myTableVC.estimatedRowHeight = 140

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
        
        if let myImageData = arr[indexPath.row].image{
            cell.myImageView.image = UIImage(data: myImageData as Data)
        }
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateArticleViewController") as! CreateArticleViewController
//        print(arr[indexPath.row].title)
//        if let title = arr[indexPath.row].title{
//            myVC.theTitle = title
//        }
//        if let content = arr[indexPath.row].content{
//            myVC.theContent = content
//        }
//        if let myImageData = arr[indexPath.row].image{
//            myVC.theImage = UIImage(data: myImageData as Data)
//        }
        myVC.theArticle = arr[indexPath.row]
//        myVC.myTextField.text = arr[indexPath.row].modificationDate
        
        self.navigationController?.pushViewController(myVC, animated: true)
    }
    
}
