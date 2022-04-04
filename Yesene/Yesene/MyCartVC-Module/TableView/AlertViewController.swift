//
//  AlertViewController.swift
//  Yesene
//
//  Created by Okan on 2.04.2022.
//

import UIKit
import Lottie
class AlertViewController: UIViewController {

    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertHeader: UILabel!
    
    @IBOutlet weak var alertContent: UILabel!
    var content : String?
    var header : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertView.layer.cornerRadius = 16
        alertView.clipsToBounds = true
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        alertHeader.text = header!
        showAnimation()
       

    }
    
    func showAnimation (){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
          
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        
    }
    
    
    
    @IBAction func okButton(_ sender: Any) {
        removeAnimation()
    }
    
    
    func removeAnimation () {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        },completion:{(finished : Bool) in
            if(finished){
                self.view.removeFromSuperview()
            }
            
        })
        
        
    }
}
