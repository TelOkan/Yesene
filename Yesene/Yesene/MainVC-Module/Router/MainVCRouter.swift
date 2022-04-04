//
//  MainVCRouter.swift
//  Yesene
//
//  Created by Okan on 28.03.2022.
//

import Foundation
class MainVCRouter : PresenterToRouterMainVCProtocol {
    static func createModule(ref: MainVC) {
        let presenter = MainVCPresenter()
        
        //View
        ref.mainVCPresenterObject = presenter
        
        //Presenter
        ref.mainVCPresenterObject?.mainVCInteractor = MainVCInteractor()
        ref.mainVCPresenterObject?.mainVCView = ref
        
        //Interactor
        ref.mainVCPresenterObject?.mainVCInteractor?.mainVCPresenter = presenter
        
        
    }
    
    
}
