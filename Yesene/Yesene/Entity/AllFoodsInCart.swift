//
//  AllFoodsInCart.swift
//  Yesene
//
//  Created by Okan on 29.03.2022.
//

import Foundation
struct AllFoodsInCart : Codable {
    let sepet_yemek_id : String
    let yemek_adi : String
    let yemek_fiyat : String
    var yemek_siparis_adet : String
    let yemek_resim_adi : String
    let kullanici_adi : String
}
