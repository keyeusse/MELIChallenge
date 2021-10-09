//
//  ViewController.swift
//  MELIStore
//
//  Created by Meli on 10/4/21.
//

import UIKit
import Alamofire
import SCLAlertView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var catTableView: UITableView!
    
    var categories = [CategoryDetail]()
    var categoryDetail = CategoryDetail()
    private let apiClient = APIClient()
    
    // MARK: - VIPER
    var presenter: ProductCategoryPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductCategoryRouter.createModule(view: self)
        presenter?.loadCategoriesData()
        
        setupTableView()
    }

    private func setupTableView() {

        self.catTableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.idCell)
        self.catTableView.dataSource = self
        self.catTableView.rowHeight = UITableView.automaticDimension
        self.catTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfItemsAt(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let category = getItemAt(indexPath),
              let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.idCell) as? CategoryTableViewCell else { return UITableViewCell()}
//        presenter?.loadCategoryData(id: category.id)
//        categoryDetail = presenter?.getItemAtCategory() ?? CategoryDetail()
        
        let URL2 = "https://api.mercadolibre.com/categories/" + category.id

                let request2 = AF.request(URL2)
                request2.responseDecodable(of: CategoryDetail.self) { (response) in
                  guard let category = response.value else { return }
                    cell.setUpCell(category: category)
                }
//        cell.setUpCell(category: categoryDetail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    private func getItemAt(_ indexPath: IndexPath) -> CategoryEntity? {
      return presenter?.getItemAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      guard let category = getItemAt(indexPath) else { return }
        presenter?.showProductListView(for: category.id, from: self)
      self.catTableView.deselectRow(at: indexPath, animated: true)
    }

}

extension ViewController: ProductCategoryViewProtocol {
    func loadCategory() {
        self.catTableView.reloadData()
    }
    
    func showErrorMessage(_ message: String) {
        SCLAlertView().showError("Error", subTitle: "Se ha presentado un error, intente más tarde", closeButtonTitle: "Cerrar") // Error
    }
    
    func loadCategories() {
        self.catTableView.reloadData()
    }
}

