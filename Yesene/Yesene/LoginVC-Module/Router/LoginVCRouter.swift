//
//  LoginVCRouter.swift
//  Yesene
//
//  Created by Okan on 4.04.2022.
//

import Foundation
class LoginVCRouter : PresenterToRouterLoginVCProtocol {
    static func createModule(ref: LoginVC) {
      var presenter = LoginVCPresenter()
      
        ref.loginVCPresenterObject = presenter
        ref.loginVCPresenterObject?.loginVCInteractor = LoginVCInteractor()
        
        
        
        
        
    }
    
    
}
