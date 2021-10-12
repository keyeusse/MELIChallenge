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
    @IBOutlet weak var shippingLabel: UILabel!
    
    
    var product = Product()
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
    
    // MARK: - Cell Settings
    func setUpCell(product : Product) {
        
        self.product = product
        setUpSkeleton(show : false)
        productNameLabel.text = product.title
        priceLabel.text = setPrice(number: product.price)
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
        
        setUpElement()
    }
    
    func setPrice(number : Double) -> String {
        let price = Int(number)
        return NumberFormatter.localizedString(from: NSNumber(value: price), number: .currency)
    }
    
    func setDoubleToString(number : Double) -> String {
        return String(format: "$ %.1f", number)
    }
    
//    setUpUIElements for view
    func setUpElement() {
        totalView.layer.cornerRadius = 10
        totalView.layer.borderWidth = 1.0
        totalView.layer.borderColor = Colors().LightGray.cgColor
        totalView.layer.shadowColor = Colors().MainGray.cgColor
        totalView.layer.shadowOffset = CGSize(width: 2, height: 2)
        totalView.layer.shadowOpacity = 0.6
        totalView.layer.shadowRadius = 10
    }
    
    
//    Skeleton call to show and hide
   private func setUpSkeleton(show : Bool) {
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
