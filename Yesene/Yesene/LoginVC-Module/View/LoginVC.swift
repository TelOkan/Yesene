//
//  LoginVC.swift
//  Yesene
//
//  Created by Okan on 3.04.2022.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
   
    
    
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var loginVCPresenterObject : ViewToPresenterLoginVCProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        LoginVCRouter.createModule(ref: self)
        loginVCPresenterObject?.drawUnderline(textField: mailTextField)
        loginVCPresenterObject?.drawUnderline(textField: passwordTextField)
    }
    

    @IBAction func logInButtonPressed(_ sender: Any) {/*
        if mailTextField.text != "" && passwordTextField.text != ""{
            Auth.auth().signIn(withEmail: mailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error!.localizedDescription)
                }else {
                    self.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
            }
        }else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
        
        
        */
        if let email = mailTextField.text , let password = passwordTextField.text {
            loginVCPresenterObject?.logIn(email: email, password: password, viewController: self)
        }
       
        
        
        
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        if let email = mailTextField.text , let password = passwordTextField.text {
            loginVCPresenterObject?.signIn(email: email, password: password, viewController: self)
        }
        
        
       /* if mailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: mailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error!.localizedDescription)
                }else {
                    self.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
            }
        }else {
           makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }*/
        
    }
    

 /*   func makeAlert(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true,completion: nil)
    }
    
    */
}
