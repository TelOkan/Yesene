//
//  ViewController.swift
//  Yesene
//
//  Created by Okan on 27.03.2022.
//

import UIKit
import Kingfisher
import Firebase
class MainVC: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    var mainVCPresenterObject : ViewToPresenterMainVCProtocol?
    var allFoodsList = [AllFoods]()
    var searchedFoodList = [AllFoods]()
    var searchedFood : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        searchBar.delegate = self
        MainVCRouter.createModule(ref: self)
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        design.minimumLineSpacing = 20
        design.minimumInteritemSpacing = 20
        let width = foodCollectionView.frame.size.width
        let cellWidth = (width-40)/1
        design.itemSize = CGSize(width: cellWidth, height: cellWidth)
        foodCollectionView.collectionViewLayout = design
       
    }

    
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toLogInVC", sender: nil)
        }catch {
           print("Error!")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainVCPresenterObject?.getAllFoods()
    }
    
}

extension MainVC : PresenterToViewMainVCProtocol {
    func sendAllFoodsToView(foodList: Array<AllFoods>) {
        self.allFoodsList = foodList
        
        DispatchQueue.main.async {
            self.foodCollectionView.reloadData()
        }
    }
    
    
}

extension MainVC : UICollectionViewDelegate,UICollectionViewDataSource,SelectedFoodProtocol {
   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if searchedFood == ""{
            return allFoodsList.count
        }else {
            return searchedFoodList.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FoodsCollectionViewCell
        
        if searchedFood == "" {
            collectionViewArragment(listName: allFoodsList, cell: cell, indexPath: indexPath)
        
        }else {
            collectionViewArragment(listName: searchedFoodList, cell: cell, indexPath: indexPath)
        }
        
        return cell
       
    }
    
    func selectedFood(indexPath: IndexPath, foodQuantity : String) {
        if searchedFood == ""{
            let selectedFood = allFoodsList[indexPath.row]
            mainVCPresenterObject?.addFoodToCart(yemek_adi: selectedFood.yemek_adi, yemek_resim_adi: selectedFood.yemek_resim_adi, yemek_fiyat: Int(selectedFood.yemek_fiyat)!, yemek_siparis_adet: Int(foodQuantity)!, kullanici_adi: (Auth.auth().currentUser?.email!)!)
        }else {
            let selectedFood = searchedFoodList[indexPath.row]
            mainVCPresenterObject?.addFoodToCart(yemek_adi: selectedFood.yemek_adi, yemek_resim_adi: selectedFood.yemek_resim_adi, yemek_fiyat: Int(selectedFood.yemek_fiyat)!, yemek_siparis_adet: Int(foodQuantity)!, kullanici_adi: (Auth.auth().currentUser?.email!)!)
        }
        
        
    }
    
 
    
    func collectionViewArragment(listName : [AllFoods] ,cell : FoodsCollectionViewCell, indexPath : IndexPath){
        let food = listName[indexPath.row]
        cell.foodDescription.text = food.yemek_adi
        cell.foodPrice.text = "\(food.yemek_fiyat) ₺"
        getFoodImage(foodName: food.yemek_resim_adi, imageView: cell.foodImage)
        cell.selectedFoodProtocol = self
        cell.indexPath = indexPath
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
    }
    func getFoodImage(foodName : String, imageView : UIImageView){
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(foodName)"){
            
            DispatchQueue.main.async {
                imageView.kf.setImage(with: url)
            }
        }
    }
    
    
    
}

extension MainVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedFood.removeAll()
        searchedFood = searchText
        searchedFoodList = allFoodsList.filter({$0.yemek_adi.contains(searchedFood)})
        foodCollectionView.reloadData()
    }
    
}

