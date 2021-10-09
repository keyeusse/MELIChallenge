//
//  ProductViewController.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    VIPER
    var presenter: ProductsPresenterProtocol?

    var categoryId: String?

    @IBOutlet weak var productsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        presenter?.getNumberOfItemsAt(section)  ?? 0
    }
    
    private func getItemAt(_ indexPath: IndexPath) -> Products? {
        return presenter?.getItemAtProducts()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = getItemAt(indexPath),
              let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.idCell) as? ProductTableViewCell else { return UITableViewCell()}
        cell.setUpCell(product: product.result[indexPath.row])
        return cell
    }

}

extension ProductViewController: ProductsViewProtocol {
    func showErrorMessage(_ message: String) {
    
    }
    
    func loadProductList() {
        self.productsTableView.reloadData()
    }
}

