//
//  ViewController.swift
//  MELIStore
//
//  Created by Meli on 10/4/21.
//

import UIKit
import Alamofire

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
        
       setCategories()
       setupCollectionView()
    }

    private func setupCollectionView() {

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
                    print(category)
                    cell.setUpCell(category: category)
                }
//        cell.setUpCell(category: categoryDetail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    private func getItemAt(_ indexPath: IndexPath) -> CategoryEntity? {
      return presenter?.getItemAt(indexPath: indexPath)
    }
   
    func setCategories() {
        
//        let URL = "https://api.mercadolibre.com/sites/MCO/categories"
//
//        let request = AF.request(URL)
//            // 2
//        request.responseDecodable(of: [CategoryEntity].self) { (response) in
//          guard let categories = response.value else { return }
//            print(categories[0])
//        }
        
//        let URL2 = "https://api.mercadolibre.com/categories/"+"MCO1747"
//
//        let request2 = AF.request(URL2)
//        request2.responseDecodable(of: CategoryDetail.self) { (response) in
//          guard let category = response.value else { return }
//            print(category)
//        }
        
//        let URL2 = "https://api.mercadolibre.com/sites/MCO/search?q=Acc.%20para%20Motos%20y%20Cuatrimotos"
//
//        let request2 = AF.request(URL2)
//        request2.responseDecodable(of: Products.self) { (response) in
//          guard let category = response.value else { return }
//            print(category.result)
//        }

//        let URL2 = "https://api.mercadolibre.com/items/MCO578271575"
//
//        let request2 = AF.request(URL2)
//        request2.responseDecodable(of: Product.self) { (response) in
//          guard let category = response.value else { return }
//            print(category)
//        }
        
//        let URL2 = "https://api.mercadolibre.com/items/MCO578271575/description"
//        
//        let request2 = AF.request(URL2)
//        request2.responseDecodable(of: ProductDetailDescription.self) { (response) in
//          guard let category = response.value else { return }
//            print(category)
//        }
        
        
        var highhills = CategoryDetail()
        highhills.name = "Tacones"
        highhills.picture = "highhills"

        var  nails = CategoryDetail()
        nails.name = "Unas"
        nails.picture = "nails"
        
        var  bagage = CategoryDetail()
        bagage.name = "Maletas"
        bagage.picture = "bagage"
        categories.append(highhills)
        categories.append(nails)
        categories.append(bagage)
    }

}

extension ViewController: ProductCategoryViewProtocol {
    func loadCategory() {
        self.catTableView.reloadData()
    }
    
    func showErrorMessage(_ message: String) {
    }
    
    func loadCategories() {
        self.catTableView.reloadData()
    }
}

