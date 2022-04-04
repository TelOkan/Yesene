//
//  LoginVCProtocols.swift
//  Yesene
//
//  Created by Okan on 4.04.2022.
//

import Foundation
import UIKit
protocol ViewToPresenterLoginVCProtocol {
    var loginVCInteractor : PresenterToInteractorLoginVCProtocol? {get set}
    func logIn(email : String, password : String, viewController : LoginVC)
    func signIn(email : String, password : String, viewController : LoginVC)
    func drawUnderline(textField : UITextField)
}

protocol PresenterToInteractorLoginVCProtocol {
    func logIn(email : String, password : String , viewController : LoginVC)
    func signIn(email : String, password : String, viewController : LoginVC)
    func drawUnderline(textField : UITextField)
}

protocol PresenterToRouterLoginVCProtocol {
    static func createModule (ref : LoginVC)
}
