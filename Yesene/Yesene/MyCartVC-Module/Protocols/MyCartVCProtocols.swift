//
//  MyCartVCProtocols.swift
//  Yesene
//
//  Created by Okan on 29.03.2022.
//

import Foundation
import UIKit
protocol viewToPresenterMyCartVCProtocol{
    var myCartVCInteractor : presenterToInteractorMyCartVCProtocol? {get set}
    var myCartVCView : presenterToViewMyCartVCProtocol? {get set}
    func getAllFoodsInCart(userID : String)
    func deleteSelectedFood(foodID : Int, userID : String)
    func playAnimation(viewController : MyCartVC)
}
protocol presenterToInteractorMyCartVCProtocol {
    var myCartVCPresenter : interactorToPresenterMyCartVCProtocol? {get set}
    func getAllFoodsInCart(userID : String)
    func deleteSelectedFood(foodID : Int, userID : String)
    func playAnimation(viewController : MyCartVC)
}
protocol interactorToPresenterMyCartVCProtocol {
    func sendAllFoodsInCartToPresenter(foodList : Array<AllFoodsInCart>)
}
protocol presenterToViewMyCartVCProtocol {
    func sendAllFoodsInCartToView(foodList : Array<AllFoodsInCart>)
}
protocol presenterToRouterMyCartVCProtocol {
    static func createModule (ref : MyCartVC)
}
