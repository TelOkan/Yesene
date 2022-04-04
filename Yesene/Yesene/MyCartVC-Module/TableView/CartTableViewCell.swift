//
//  CartTableViewCell.swift
//  Yesene
//
//  Created by Okan on 29.03.2022.
//

import UIKit
protocol DeleteFoodProtocol {
    func deleteFood(indexPath : IndexPath )
}
class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    var deleteFoodProtocol : DeleteFoodProtocol?
    var indexPath : IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func deleteFood(_ sender: Any) {
        deleteFoodProtocol?.deleteFood(indexPath: indexPath!)
    }

}
