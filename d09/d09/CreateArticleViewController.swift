//
//  CreateArticleViewController.swift
//  d09
//
//  Created by Martin SIREAU on 10/14/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit
import msireau2017

class CreateArticleViewController: UIViewController {

    var articleManager : ArticleManager?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleManager = ArticleManager(managedObjectContext: self.context)
    }

    @IBAction func saveButton(_ sender: Any) {
        if let article1 = articleManager?.newArticle(){
            article1.title = myTextField.text
            article1.content = myTextView.text
            article1.creationDate = NSDate()
            article1.modificationDate = NSDate()
            article1.langage = Locale.preferredLanguages[0]
        }
        
        articleManager?.save()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButt(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
