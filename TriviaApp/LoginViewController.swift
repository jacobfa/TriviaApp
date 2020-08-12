//
//  LoginController.swift
//  TriviaApp
//
//  Created by Jacob Fein-Ashley on 6/22/18.
//  Copyright © 2018 Jacob Fein-Ashley. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Kingfisher

class LoginController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccount(_ sender: Any) {
        if let email = emailTextField.text, let pass = passwordTextField.text{
                Auth.auth().createUser(withEmail: email, password: pass)
            if Auth.auth().currentUser != nil {
                performSegue(withIdentifier: "goToTabApp", sender: self)
                
            }
        }
    }
    
    @IBAction func login(_ sender: Any) {
//        let authViewController = self.auth?.authViewController()
//        self.present(authViewController!, animated: true, completion: nil)
        if let email = emailTextField.text, let pass = passwordTextField.text{
                Auth.auth().signIn(withEmail: email, password: pass)
            let user = Auth.auth().currentUser
            if Auth.auth().currentUser != nil {
                performSegue(withIdentifier: "goToTabApp", sender: self)
            }
        }
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
