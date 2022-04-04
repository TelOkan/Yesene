//
//  MainVCPresenter.swift
//  Yesene
//
//  Created by Okan on 28.03.2022.
//

import Foundation
class MainVCPresenter : ViewToPresenterMainVCProtocol {
    
    
    
    var mainVCInteractor: PresenterToInteractorMainVCProtocol?
    
    var mainVCView: PresenterToViewMainVCProtocol?
    
    func getAllFoods() {
        mainVCInteractor?.getAllFoods()
    }
    func addFoodToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        mainVCInteractor?.addFoodToCart(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
}

extension MainVCPresenter : InteractorToPresenterMainVCProtocol {
    
    func sendAllFoodsToPresenter(foodList: Array<AllFoods>) {
        mainVCView?.sendAllFoodsToView(foodList: foodList)
    }
    
    
}
