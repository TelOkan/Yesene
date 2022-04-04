//
//  LoginVCInteractor.swift
//  Yesene
//
//  Created by Okan on 4.04.2022.
//

import Foundation
import UIKit
import Firebase
class LoginVCInteractor : PresenterToInteractorLoginVCProtocol{

    
    
    
    
    func logIn(email: String, password: String, viewController: LoginVC) {
        if email != "" && password != ""{
            Auth.auth().signIn(withEmail: email, password: password) { (authdata, error) in
                if error != nil {
                    self.makeAlert(header: "Error!", content: error!.localizedDescription,viewController: viewController)
                }else {
                    viewController.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
            }
        }else {
            makeAlert(header: "Error!", content: "Username/Password?",viewController: viewController)
        }
    }
    
    
    
    func signIn(email: String, password: String, viewController: LoginVC) {
        
         if email != "" && password != "" {
             Auth.auth().createUser(withEmail: email, password: password) { (authdata, error) in
                 
                 if error != nil {
                     self.makeAlert(header: "Error!", content: error!.localizedDescription,viewController: viewController)
                 }else {
                     viewController.performSegue(withIdentifier: "toMainVC", sender: nil)
                 }
             }
         }else {
             self.makeAlert(header: "Error!", content: "Username/Password?",viewController: viewController)
         }
    }
    
    
   
    
    func makeAlert(header : String, content : String ,viewController: LoginVC) {
        
        let popOverVC = viewController.storyboard?.instantiateViewController(withIdentifier: "ErrorPopup") as! ErrorAlertViewController
        popOverVC.header = header
        popOverVC.content = content
        viewController.addChild(popOverVC)
        popOverVC.view.frame = viewController.view.frame
        viewController.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: viewController)
    }
    
    func drawUnderline(textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width-45, height: 1.0)
        bottomLine.backgroundColor = UIColor.orange.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
}
