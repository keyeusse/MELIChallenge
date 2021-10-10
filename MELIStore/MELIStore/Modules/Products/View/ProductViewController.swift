//
//  ProductViewController.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit
import SCLAlertView

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var productsTableView: UITableView!

//    VIPER
    var presenter: ProductsPresenterProtocol?
    var categoryId: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSkeleton(show : true)
        presenter?.loadProdutsData(categoryId: categoryId ?? "")
        setupTableView()
    }
    
    private func setupTableView() {

        self.productsTableView.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.idCell)
        self.productsTableView.dataSource = self
        self.productsTableView.rowHeight = UITableView.automaticDimension
        self.productsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getNumberOfItemsAt(section)  ?? 3
    }
    
    private func getItemAt(_ indexPath: IndexPath) -> Products? {
        setUpSkeleton(show : false)
        return presenter?.getItemAtProducts()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(NumberResources.productSize.rawValue)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = getItemAt(indexPath),
              let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.idCell) as? ProductTableViewCell else { return UITableViewCell()}
        cell.setUpCell(product: product.result[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let product = getItemAt(indexPath)?.result[indexPath.row] else { return }
        presenter?.showProducDetailView(for: product, from: self)
      self.productsTableView.deselectRow(at: indexPath, animated: true)
    }
    
    //    Skeleton call
        private func setUpSkeleton(show : Bool){
            productsTableView.isSkeletonable = true
            if(show){
                productsTableView.showAnimatedGradientSkeleton()
            } else{
                productsTableView.hideSkeleton()
            }
        }

}

extension ProductViewController: ProductsViewProtocol {
    func showErrorMessage(_ message: String) {
        SCLAlertView().showError(TextResources.errorTitle.rawValue, subTitle: TextResources.errorDetail.rawValue, closeButtonTitle: TextResources.closeButton.rawValue) // Error
    }
    
    func loadProductList() {
        self.productsTableView.reloadData()
        setUpSkeleton(show : true)
    }
}

