//
//  CreateArticleViewController.swift
//  d09
//
//  Created by Martin SIREAU on 10/14/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit
import msireau2017

class CreateArticleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var articleManager : ArticleManager?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let pickerController = UIImagePickerController()
    
    var myImage : UIImage?
    
    var theTitle : String?
    var theContent : String?
    var theImage : UIImage?
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        myTextField.text = theTitle
        myTextView.text = theContent
        myImageView.image = theImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        
        articleManager = ArticleManager(managedObjectContext: self.context)
    }

    @IBAction func saveButton(_ sender: Any) {
        if let article1 = articleManager?.newArticle(){
            article1.title = myTextField.text
            article1.content = myTextView.text
            article1.creationDate = NSDate()
            article1.modificationDate = NSDate()
            if let theImage = myImage {
                article1.image = UIImagePNGRepresentation(theImage) as NSData?
            }
            article1.langage = Locale.preferredLanguages[0]
        }
        
        articleManager?.save()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButt(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ChoosePic(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            pickerController.sourceType = .photoLibrary
            present(pickerController, animated: true, completion: nil)
        }
    }

    @IBAction func takePic(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            pickerController.sourceType = .camera
            present(pickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        myImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }

}
