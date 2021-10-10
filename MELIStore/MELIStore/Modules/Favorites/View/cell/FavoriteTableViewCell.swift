//
//  FavoriteTableViewCell.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit
import SCLAlertView

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var proceLabel: UILabel!
    @IBOutlet weak var feesLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    @IBAction func buyAction(_ sender: Any) {
        SCLAlertView().showSuccess(TextResources.buyTitle.rawValue, subTitle: TextResources.buyDescription.rawValue, closeButtonTitle: TextResources.perfect.rawValue)
    }
    
    var favorite = Favorite()
    
    static let idCell = "FavoriteTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "FavoriteTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpFavoriteCell(with favorite : Favorite) {
        self.favorite = favorite
        productNameLabel.text = favorite.name
        proceLabel.text = favorite.price
        feesLabel.text = favorite.fees
        productImageView.image = UIImage(named: favorite.image)
        
        buyButton.backgroundColor = Colors().Blue
        buyButton.layer.cornerRadius = 10
        buyButton.layer.borderWidth = 1
        buyButton.layer.borderColor = Colors().LightGray.cgColor
    }
    
}
