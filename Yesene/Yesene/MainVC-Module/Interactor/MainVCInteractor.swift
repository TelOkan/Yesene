//
//  MainVCInteractor.swift
//  Yesene
//
//  Created by Okan on 27.03.2022.
//

import Foundation
import Alamofire
class MainVCInteractor : PresenterToInteractorMainVCProtocol {
   
    
    
    var mainVCPresenter: InteractorToPresenterMainVCProtocol?
    
    func getAllFoods() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response{response in
            if let data = response.data {
                do {
                    
                    let incomingResponse = try JSONDecoder().decode(AllFoodsResponse.self, from: data)
                    if let allFoodList = incomingResponse.yemekler{
                        self.mainVCPresenter?.sendAllFoodsToPresenter(foodList: allFoodList)
                    }
                    
                    
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func addFoodToCart(yemek_adi : String,yemek_resim_adi : String,yemek_fiyat : Int,yemek_siparis_adet : Int,kullanici_adi : String) {
        let params : Parameters = ["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response{response in
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
}
