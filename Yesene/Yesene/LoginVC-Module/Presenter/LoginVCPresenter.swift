//
//  LoginVCPresenter.swift
//  Yesene
//
//  Created by Okan on 4.04.2022.
//

import Foundation
import UIKit
class LoginVCPresenter : ViewToPresenterLoginVCProtocol {
    
    
    var loginVCInteractor: PresenterToInteractorLoginVCProtocol?
    
    func logIn(email: String, password: String, viewController: LoginVC) {
        loginVCInteractor?.logIn(email: email, password: password, viewController: viewController)
    }
    
    func signIn(email: String, password: String, viewController: LoginVC) {
        loginVCInteractor?.signIn(email: email, password: password, viewController: viewController)
    }
    
    func drawUnderline(textField: UITextField) {
        loginVCInteractor?.drawUnderline(textField: textField)
    }
}
