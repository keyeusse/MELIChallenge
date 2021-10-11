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
        SCLAlertView().showSuccess(TextResources.cartTitle.rawValue, subTitle: TextResources.cartDescription.rawValue, closeButtonTitle: TextResources.ok.rawValue)
    }
    //  VIPER
    var presenter: ProductDetailPresenterProtocol?
    
    var product = Product()
    
    //    Stars for ratting
    let blackStar = TextResources.blackStar.rawValue
    let whiteStar = TextResources.whiteStar.rawValue
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func buyProductAction(_ sender: Any) {
        SCLAlertView().showSuccess(TextResources.buyTitle.rawValue, subTitle: TextResources.buyDescription.rawValue, closeButtonTitle: TextResources.perfect.rawValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = TextResources.detail.rawValue
        
//        Viper calls
        ProductDetailRouter.createProductDetailModule(for: self)
        presenter?.loadDescriptionData(categoryId: product.id)
        
        setUpCollectionView()
        setUpView()
    }
    
    //MARK: -- View settings
    func setUpCollectionView() {
        pictureCollectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageCollectionViewCell.idCell)
        pictureCollectionView.dataSource = self
        pictureCollectionView.delegate = self
    }
    
    func setUpView() {
        nameLabel.text = product.title
        rattingLabel.text = blackStar + blackStar + blackStar + blackStar + whiteStar
        priceLabel.text = "$" + setPrice(number: product.price)
//        feesLabel.text = "en" + String(product.installments?.quantity) + "X" + String(product.installments?.amount ?? 0 )
//        availableLabel.text = String(product?.availability) ?? "20 unidades"
//
//        let billTotal = String(product.installments?.quantity!) ?? "0.0"
        
        
        if((product.shipping?.freeShipping) != nil){
            shippingLabel.text = TextResources.freeShipping.rawValue
        } else {
            shippingLabel.text = TextResources.whenShipping.rawValue
        }
        
        buyButton.backgroundColor = Colors().Blue
        buyButton.layer.cornerRadius = 10
        buyButton.layer.borderWidth = 1
        buyButton.layer.borderColor = Colors().LightGray.cgColor
    }
    
    func setPrice(number : Double) -> String {
        let price = Int(number)
        return NumberFormatter.localizedString(from: NSNumber(value: price), number: .currency)
    }
    
    private func getDescription() -> ProductDetailDescription? {
        return presenter?.getProductDescription()
    }
}

//MARK: -- GET DATA FROM API SERVICE
extension ProductDetailViewController: ProductDetailViewProtocol{
    
    func loadProductDescription() {
        descriptionLabel.text = presenter?.getProductDescription()?.plainText
    }
    
    func showErrorMessage(_ message: String) {
        SCLAlertView().showError(TextResources.errorTitle.rawValue, subTitle: message, closeButtonTitle: TextResources.closeButton.rawValue) // Error
    }
    
    func showNoInternetErrorMessage(_ message: String) {
        SCLAlertView().showInfo(TextResources.errorTitle.rawValue, subTitle: message, closeButtonTitle: TextResources.closeButton.rawValue) // Error
    }

}

//CollectionView image datasource and delegate
extension ProductDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.idCell, for: indexPath) as! ImageCollectionViewCell
        cell.setUpCell(image: product.image ?? TextResources.noImage.rawValue)
        return cell
    }
}

