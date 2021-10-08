//
//  ProductTableViewCell.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var productImage: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var feesLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var sendLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favoriteBtnAction(_ sender: Any) {
    }
}
