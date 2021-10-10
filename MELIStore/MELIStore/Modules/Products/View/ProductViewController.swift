//
//  ProductViewController.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit
import SCLAlertView

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var productsTableView: UITableView!

//    VIPER
    var presenter: ProductsPresenterProtocol?
    var categoryId: String?
    var shouldAnimateCell : Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProductsRouter.createProductsModule(for: self, and: "")
        presenter?.loadProdutsData(categoryId: categoryId ?? "")
        
        setupTableView()
        spinner.startAnimating()

    }
    
    private func setupTableView() {
        self.productsTableView.reloadData()
        self.productsTableView.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.idCell)
        self.productsTableView.dataSource = self
        self.productsTableView.rowHeight = UITableView.automaticDimension
        self.productsTableView.delegate = self
        self.productsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getNumberOfItemsAt(section)  ?? 0
    }
    
    private func getItemAt(_ indexPath: IndexPath) -> Products? {
        return presenter?.getItemAtProducts()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(NumberResources.productSize.rawValue)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = getItemAt(indexPath),
              let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.idCell) as? ProductTableViewCell else { return UITableViewCell()}
        spinner.stopAnimating()
        cell.setUpCell(product: product.result[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let product = getItemAt(indexPath)?.result[indexPath.row] else { return }
        presenter?.showProducDetailView(for: product, from: self)
      self.productsTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProductViewController: ProductsViewProtocol {
    func showErrorMessage(_ message: String) {
        SCLAlertView().showError(TextResources.errorTitle.rawValue, subTitle: TextResources.errorDetail.rawValue, closeButtonTitle: TextResources.closeButton.rawValue) // Error
    }
    
    func loadProductList() {
        self.productsTableView.reloadData()
    }
}

