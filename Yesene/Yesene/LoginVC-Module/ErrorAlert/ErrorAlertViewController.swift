//
//  ErrorAlertViewController.swift
//  Yesene
//
//  Created by Okan on 4.04.2022.
//

import UIKit

class ErrorAlertViewController: UIViewController {

    @IBOutlet weak var errorTextView: UITextView!
    @IBOutlet weak var errorAlertView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    var content : String?
    var header : String?
    override func viewDidLoad() {
        super.viewDidLoad()
         
        errorAlertView.layer.cornerRadius = 16
        errorAlertView.clipsToBounds = true
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        headerLabel.text = header!
        errorTextView.text = content!
        showAlert()
        
    }
    
    
    func showAlert (){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
    }
    
    func closeAlert () {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        },completion:{(finished : Bool) in
            if(finished){
                self.view.removeFromSuperview()
            }
            
        })
        
        
    }

    @IBAction func okButtonPressed(_ sender: Any) {
        closeAlert()
    }
    
}
