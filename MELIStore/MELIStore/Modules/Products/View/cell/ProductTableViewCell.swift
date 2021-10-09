//
//  ProductTableViewCell.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var currencyLabel: UILabel!
    var product = Product()
    
    @IBOutlet weak var shippingLabel: UILabel!
    static let idCell = "ProductTableViewCell"
    
    
    static func nib() -> UINib{
        return UINib(nibName: "ProductTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(product : Product) {
        self.product = product
        productNameLabel.text = product.title
        priceLabel.text = setDoubleToString(number: product.price)
        currencyLabel.text = product.currency
        if((product.shipping?.freeShipping) != nil){
            shippingLabel.text = "Envío gratis"
        } else {
            shippingLabel.text = "Llega mañana por $10.000"
        }
        
        
        let noImage =  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Imagen_no_disponible.svg/1024px-Imagen_no_disponible.svg.png"
        
        // Create URL
        let url = URL(string: product.image ?? noImage)!
        
           // Fetch Image Data
           if let data = try? Data(contentsOf: url) {
               // Create Image and Update Image View
            productImage.image = UIImage(data: data)
           }
      

        let yourColor : UIColor = UIColor.lightGray
        totalView.layer.masksToBounds = true
        totalView.layer.borderColor = yourColor.cgColor
        totalView.layer.borderWidth = 1.0
        self.totalView.layer.cornerRadius = 13
        totalView.layer.shadowColor = UIColor.black.cgColor
        totalView.layer.shadowOpacity = 0.2
        totalView.layer.shadowOffset = CGSize(width: 4, height: 4)
        totalView.layer.shadowRadius = 13.0
        totalView.layer.masksToBounds = false
    }
    
    func setDoubleToString(number : Double) -> String {
        return String(format: "%f", number)
    }
    
    @IBAction func favoriteBtnAction(_ sender: Any) {
    }
}
