//
//  ProductTableViewCell.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit
import SCLAlertView

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
        setUpSkeleton(show : true)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(product : Product) {
        self.product = product
        setUpSkeleton(show : false)
        productNameLabel.text = product.title
        priceLabel.text = setDoubleToString(number: product.price)
        currencyLabel.text = product.currency
        if((product.shipping?.freeShipping) != nil){
            shippingLabel.text = TextResources.freeShipping.rawValue
        } else {
            shippingLabel.text = TextResources.whenShipping.rawValue
        }
        
        // Create URL
        let url = URL(string: product.image ?? TextResources.noImage.rawValue)!
        
           // Fetch Image Data
           if let data = try? Data(contentsOf: url) {
               // Create Image and Update Image View
            productImage.image = UIImage(data: data)
           }
      

        totalView.layer.masksToBounds = true
        totalView.layer.borderColor = Colors().MainGray.cgColor
        totalView.layer.borderWidth = 1.0
        self.totalView.layer.cornerRadius = 13
        totalView.layer.shadowColor = Colors().LightGray.cgColor
        totalView.layer.shadowOpacity = 0.2
        totalView.layer.shadowOffset = CGSize(width: 2, height: 4)
        totalView.layer.shadowRadius = 13.0
        totalView.layer.masksToBounds = false
        favoriteButton.layer.cornerRadius = 0.5 * favoriteButton.bounds.size.width
    }
    
    func setDoubleToString(number : Double) -> String {
        return String(format: "$ %.1f", number)
    }
    
    func setPriceFormatter(price : Double){
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
//        let priceString = currencyFormatter.string(from: NSNumber(price))!
    }
    
//    Skeleton call to show and hide
           private func setUpSkeleton(show : Bool){
            
            productNameLabel.isSkeletonable = true
            productNameLabel.linesCornerRadius = 8
            priceLabel.isSkeletonable = true
            priceLabel.linesCornerRadius = 8
            currencyLabel.isSkeletonable = true
            currencyLabel.linesCornerRadius = 8
            productImage.isSkeletonable = true
            productImage.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .systemGray6), animation: nil, transition: .crossDissolve(0.5))
            productImage.layer.cornerRadius = 10
            
                if(show){
                    productNameLabel.showAnimatedGradientSkeleton()
                    priceLabel.showAnimatedGradientSkeleton()
                    currencyLabel.showAnimatedGradientSkeleton()
                    productImage.showAnimatedGradientSkeleton()
                } else {
                    productNameLabel.hideSkeleton()
                    priceLabel.hideSkeleton()
                    currencyLabel.hideSkeleton()
                    productImage.hideSkeleton()
                }
           }
    
    @IBAction func favoriteBtnAction(_ sender: Any) {
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
}
