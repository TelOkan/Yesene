//
//  FoodsCollectionViewCell.swift
//  Yesene
//
//  Created by Okan on 28.03.2022.
//

import UIKit
protocol SelectedFoodProtocol {
    func selectedFood(indexPath : IndexPath, foodQuantity : String)
}
class FoodsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var FoodQuantityView: UIView!
    @IBOutlet weak var foodQuantity: UILabel!
    var quantity : Int = 0
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    var  selectedFoodProtocol : SelectedFoodProtocol?
    var indexPath : IndexPath?
    @IBAction func addToCard(_ sender: Any) {
        selectedFoodProtocol?.selectedFood(indexPath: indexPath!, foodQuantity: foodQuantity.text!)
    }
    
    
    @IBAction func foodQuantityIncrease(_ sender: Any) {
        
        if let quantityFood = foodQuantity.text {
             
            quantity = Int(quantityFood)!
            
            quantity += 1
            
            foodQuantity.text = String(quantity)
            
        }
        
    }
    
    
    @IBAction func foodQuantityDecrease(_ sender: Any) {
        if let quantityFood = foodQuantity.text {
             
            quantity = Int(quantityFood)!
            
            if quantity >= 2  && quantity != 1{
                quantity -= 1
                foodQuantity.text = String(quantity)
            }
            
            
        }
    }
    
}
