//
//  FavoriteTableViewCell.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var proceLabel: UILabel!
    @IBOutlet weak var feesLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
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
    }
    
}
