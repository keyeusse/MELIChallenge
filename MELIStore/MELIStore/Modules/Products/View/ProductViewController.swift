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
    

    @IBOutlet weak var productsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.loadProdutsData(categoryId: "")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.idCell, for: indexPath) as! CategoryTableViewCell
//        cell.setUpCell(with: categories[indexPath.row])
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

