//
//  MyCartVC.swift
//  Yesene
//
//  Created by Okan on 29.03.2022.
//

import UIKit
import SwiftUI
import Firebase


class MyCartVC: UIViewController {

    
    @IBOutlet weak var totalPriceLabel: UILabel!
    var totalPrice : Double = 0.0
    @IBOutlet weak var cartTableView: UITableView!
    var myCartVCPresenterObject : viewToPresenterMyCartVCProtocol?
    var allFoodsInCart = [AllFoodsInCart]()
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        MyCartVCRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myCartVCPresenterObject?.getAllFoodsInCart(userID: (Auth.auth().currentUser?.email)!)
        
    }
    
    @IBAction func completeShoppingButton(_ sender: Any) {
        allFoodsInCart.forEach { item in
            myCartVCPresenterObject?.deleteSelectedFood(foodID: Int(item.sepet_yemek_id)!, userID: (Auth.auth().currentUser?.email)!)
        }
        DispatchQueue.main.async {
            self.myCartVCPresenterObject?.getAllFoodsInCart(userID: (Auth.auth().currentUser?.email)!)
            self.cartTableView.reloadData()
            self.myCartVCPresenterObject?.playAnimation(viewController: self)
        
        }
        
     
    }
    

}
extension MyCartVC : presenterToViewMyCartVCProtocol {
    
    func sendAllFoodsInCartToView(foodList: Array<AllFoodsInCart>) {
        totalPrice = 0.0
        allFoodsInCart =  foodList
        
        allFoodsInCart.forEach { item in
            totalPrice += Double(item.yemek_fiyat)!
        }
        totalPriceLabel.attributedText = NSMutableAttributedString().normal("Toplam Tutar : ").bold("\(totalPrice) ₺")
        DispatchQueue.main.async {
            
            self.cartTableView.reloadData()
        }
        
    }
    
    
}
extension MyCartVC : UITableViewDelegate , UITableViewDataSource, DeleteFoodProtocol{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFoodsInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartFood = allFoodsInCart[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        cell.foodDescription.text = cartFood.yemek_adi
        let foodPrice = (Double(cartFood.yemek_fiyat)! * Double(cartFood.yemek_siparis_adet)!)
        cell.foodPrice.attributedText = NSMutableAttributedString().bold(cartFood.yemek_siparis_adet).normal(" x ").bold("\(foodPrice) ₺")
        getFoodImage(foodName: cartFood.yemek_resim_adi, imageView: cell.foodImage)
        cell.deleteFoodProtocol = self
        cell.indexPath = indexPath
        cell.foodImage.layer.borderWidth = 0.75
        cell.foodImage.layer.cornerRadius = 8
        cell.foodImage.layer.borderColor = UIColor.black.cgColor
    
        return cell
        
        
    }
    
    func deleteFood(indexPath: IndexPath) {
        let foodID = allFoodsInCart[indexPath.row].sepet_yemek_id
        myCartVCPresenterObject?.deleteSelectedFood(foodID: Int(foodID)!, userID: (Auth.auth().currentUser?.email)!)
        self.myCartVCPresenterObject?.getAllFoodsInCart(userID: (Auth.auth().currentUser?.email)!)
        DispatchQueue.main.async {
    
            self.cartTableView.reloadData()
        }
    }
    
    
    
    func getFoodImage(foodName : String, imageView : UIImageView){
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(foodName)"){
            
            DispatchQueue.main.async {
                imageView.kf.setImage(with: url)
            }
        }
    }
    
}
extension NSMutableAttributedString { //aynı label içerisinde hem normal hemde bold olarak yazırmak için
    var fontSize:CGFloat { return 20 }
    var boldFont:UIFont { return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
