//
//  MyCartVCRouter.swift
//  Yesene
//
//  Created by Okan on 29.03.2022.
//

import Foundation
class MyCartVCRouter  : presenterToRouterMyCartVCProtocol {
    static func createModule(ref: MyCartVC) {
       let presenter = MyCartVCPresenter()
        
        //view
        ref.myCartVCPresenterObject = presenter
        
        //presenter
        ref.myCartVCPresenterObject?.myCartVCInteractor = MyCartVCInteractor()
        ref.myCartVCPresenterObject?.myCartVCView = ref
        
        //Interactor
        ref.myCartVCPresenterObject?.myCartVCInteractor?.myCartVCPresenter = presenter
        
    }
    
    
}
