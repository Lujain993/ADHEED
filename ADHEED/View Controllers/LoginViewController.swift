//
//  LoginViewController.swift
//  ADHEED
//
//  Created by Lujain Z on 20/01/2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextFiled: UITextField!
    
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    
    @IBOutlet weak var errorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"back2")!)
        errorLable.alpha = 0


        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLable.text = error!.localizedDescription
                self.errorLable.alpha = 1
            }
            else {
                
                let HomeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = HomeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }

   

}
