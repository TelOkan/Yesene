//
//  MyCartVCPresenter.swift
//  Yesene
//
//  Created by Okan on 29.03.2022.
//

import Foundation
class MyCartVCPresenter : viewToPresenterMyCartVCProtocol {
   
    
   
    
    var myCartVCInteractor: presenterToInteractorMyCartVCProtocol?
    
    var myCartVCView: presenterToViewMyCartVCProtocol?
    
    func getAllFoodsInCart(userID: String) {
        myCartVCInteractor?.getAllFoodsInCart(userID: userID)
    }
    
    
}
extension MyCartVCPresenter : interactorToPresenterMyCartVCProtocol {
    func sendAllFoodsInCartToPresenter(foodList: Array<AllFoodsInCart>) {
        myCartVCView?.sendAllFoodsInCartToView(foodList: foodList)
    }
    
    func deleteSelectedFood(foodID: Int, userID: String) {
        myCartVCInteractor?.deleteSelectedFood(foodID: foodID, userID: userID)
    }
    func playAnimation(viewController: MyCartVC) {
        myCartVCInteractor?.playAnimation(viewController: viewController)
    }
}
