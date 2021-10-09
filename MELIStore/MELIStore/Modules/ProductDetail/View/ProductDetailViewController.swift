//
//  ProductDetailViewController.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit
import SCLAlertView

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
    
    @IBAction func cartAction(_ sender: Any) {
        
        SCLAlertView().showSuccess("Producto agregado", subTitle: "Tu producto fue agregado al carrito de compras", closeButtonTitle: "Está bien")
    }
    //  VIPER
    var presenter: ProductDetailPresenterProtocol?
    
    var product = Product()
    
    //    Stars for ratting
    let blackStar = "\u{2605}"
    let whiteStar = "\u{2606}"
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func buyProductAction(_ sender: Any) {
        SCLAlertView().showSuccess("Compra exitosa", subTitle: "Tu compra se ejecutó con éxito", closeButtonTitle: "¡Perfecto!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadProductDetailData(productId: product.id)
        setUpView()
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
        
        buyButton.backgroundColor = .blue
        buyButton.layer.cornerRadius = 10
        buyButton.layer.borderWidth = 1
        buyButton.layer.borderColor = UIColor.black.cgColor
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol{
    func loadProductDescription() {
        
    }
    
    func showErrorMessage(_ message: String) {
        SCLAlertView().showError("Error", subTitle: "Se ha presentado un error, intente más tarde", closeButtonTitle: "Cerrar") // Error
    }

}
