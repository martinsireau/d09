//
//  ViewController.swift
//  d09
//
//  Created by Martin SIREAU on 10/13/17.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit
import msireau2017
import LocalAuthentication

class ViewController: UIViewController {

    let myContext = LAContext()
    var authError: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func authButton(_ sender: Any) {
        if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: " ") { success, evaluateError in
                if success {
                    self.present((self.storyboard?.instantiateViewController(withIdentifier: "navVC"))!, animated: true, completion: nil)
                    print("Succexx")
                } else {
                    print("Error1")
                    self.keyboardAuth()
                }
            }
        } else {
            print("No Touch ID")
            self.keyboardAuth()
        }

    }
    
    func keyboardAuth(){
        myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: " ") { success, evaluateError in
            if success {
                self.present((self.storyboard?.instantiateViewController(withIdentifier: "navVC"))!, animated: true, completion: nil)
                print("Success")
            } else {
                print("Error2")
            }
        }
    }
    
}

