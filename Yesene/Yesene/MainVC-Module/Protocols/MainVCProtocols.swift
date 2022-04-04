//
//  MainVCProtocols.swift
//  Yesene
//
//  Created by Okan on 27.03.2022.
//

import Foundation
protocol ViewToPresenterMainVCProtocol {
    var mainVCInteractor : PresenterToInteractorMainVCProtocol? {get set}
    var mainVCView : PresenterToViewMainVCProtocol? {get set}
    func getAllFoods()
    func addFoodToCart(yemek_adi : String,yemek_resim_adi : String,yemek_fiyat : Int,yemek_siparis_adet : Int,kullanici_adi : String)
    
    
}

protocol PresenterToInteractorMainVCProtocol {
    var mainVCPresenter : InteractorToPresenterMainVCProtocol? {get set}
    func getAllFoods()
    func addFoodToCart(yemek_adi : String,yemek_resim_adi : String,yemek_fiyat : Int,yemek_siparis_adet : Int,kullanici_adi : String)
    
}

protocol InteractorToPresenterMainVCProtocol {
    func sendAllFoodsToPresenter(foodList : Array<AllFoods>)
}

protocol PresenterToViewMainVCProtocol {
    func sendAllFoodsToView(foodList : Array<AllFoods>)
}

protocol PresenterToRouterMainVCProtocol {
    static func createModule (ref : MainVC)
}
