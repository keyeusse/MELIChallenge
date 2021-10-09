//
//  ProductDetailViewController.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var cartButton: UIBarButtonItem!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rattingLabel: UILabel!
    @IBOutlet weak var pictureCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var feesLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    var product = Product()
    
//  VIPER
    var presenter: ProductDetailPresenterProtocol?
    
//    Stars for ratting
    let blackStar = "\u{2605}"
    let whiteStar = "\u{2606}"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadProdutDetailData(productId: product.id)
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        nameLabel.text = product.title
        rattingLabel.text = blackStar + blackStar + blackStar + blackStar + whiteStar
        priceLabel.text = "$" + String(product.price)
//        feesLabel.text = "en" + String(product.installments?.quantity) + "X" + String(product.installments?.amount ?? 0 )
//        availableLabel.text = String(product.availability)
        
       
        
        if((product.shipping?.freeShipping) != nil){
            shippingLabel.text = "Envío gratis"
        } else {
            shippingLabel.text = "Llega mañana por $10.000"
        }
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol{
    func loadProductDescription(productDescription: String) {
        
    }
    
    func showErrorMessage(_ message: String) {
        
    }

}
