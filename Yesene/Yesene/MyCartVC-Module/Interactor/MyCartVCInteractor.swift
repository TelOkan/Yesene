//
//  MyCartVCInteractor.swift
//  Yesene
//
//  Created by Okan on 29.03.2022.
//

import Foundation
import Alamofire
class MyCartVCInteractor : presenterToInteractorMyCartVCProtocol {
   
    
    
    
    
    var myCartVCPresenter: interactorToPresenterMyCartVCProtocol?
    
    func getAllFoodsInCart(userID : String) {
        let params : Parameters = ["kullanici_adi":userID]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response{response in
            if let data = response.data{
                do{
                    let incomingResponse = try JSONDecoder().decode(AllFoodsInCartResponse.self, from: data)
                    if let allFoodsInCartList = incomingResponse.sepet_yemekler{
                        self.myCartVCPresenter?.sendAllFoodsInCartToPresenter(foodList: allFoodsInCartList)
                    }
                }catch {
                    let list = [AllFoodsInCart]()
                    self.myCartVCPresenter?.sendAllFoodsInCartToPresenter(foodList: list)
                    
                }
            }
            
        }
        
    }
    
    func deleteSelectedFood(foodID: Int, userID: String) {
        let params : Parameters = ["sepet_yemek_id":foodID,"kullanici_adi":userID]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response{response in
            if let data = response.data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func playAnimation(viewController: MyCartVC) {
        let popOverVC = viewController.storyboard?.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        popOverVC.header = "Siparişinizi Aldık!"
       
        viewController.addChild(popOverVC)
        popOverVC.view.frame = viewController.view.frame
        viewController.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: viewController)
    }
}
