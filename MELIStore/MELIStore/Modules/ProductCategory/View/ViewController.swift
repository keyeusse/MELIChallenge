//
//  ViewController.swift
//  MELIStore
//
//  Created by Meli on 10/4/21.
//

import UIKit
import Alamofire
import SCLAlertView
import SkeletonView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var catTableView: UITableView!
    
    var categories = [String]()
    private let apiClient = APIClient()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
      return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
    
    // MARK: - VIPER
    var presenter: ProductCategoryPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductCategoryRouter.createModule(view: self)
        presenter?.loadCategoriesData()
        
        setupTableView()
        setSearchBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
    }
    
    func setSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = TextResources.searchProducts.rawValue
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.searchBar.backgroundColor = Colors().White
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
               searchBar.resignFirstResponder()
        setUpSkeleton(show: false)
        catTableView.reloadData()
        }

    private func setupTableView() {
        if isSearchBarEmpty {
            self.catTableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.idCell)
        } else {
            self.catTableView.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.idCell)
        }
        self.catTableView.dataSource = self
        self.catTableView.rowHeight = UITableView.automaticDimension
        self.catTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isFiltering {
            return presenter?.getNumberOfItemsAt(section) ?? 0
        } else {
            return presenter?.getNumberSearchedOfItemsAt(section) ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !isFiltering {
        guard let category = getCategoriesItemAt(indexPath),
              let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.idCell) as? CategoryTableViewCell else { return UITableViewCell()}
        cell.setUpCell(id: category.id)
            return cell
        } else {
            guard let product = getProductsItemAt(indexPath),
                  let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.idCell) as? ProductTableViewCell else { return UITableViewCell()}
            cell.setUpCell(product: product.result[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSearchBarEmpty {
            return CGFloat(NumberResources.categorySize.rawValue)
        } else {
            return CGFloat(NumberResources.productSize.rawValue)
        }
    }
    
    private func getCategoriesItemAt(_ indexPath: IndexPath) -> CategoryEntity? {
        setUpSkeleton(show : false)
      return presenter?.getItemAt(indexPath: indexPath)
    }
    
    private func getProductsItemAt(_ indexPath: IndexPath) -> Products? {
        setUpSkeleton(show : false)
      return presenter?.getProductData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearchBarEmpty{
            guard let category = getCategoriesItemAt(indexPath) else { return }
              presenter?.showProductListView(for: category.id, from: self)
        } else {
            guard let product = getProductsItemAt(indexPath)?.result[indexPath.row] else { return }
            presenter?.showProductDetailView(for: product, from: self)
        }
     
      self.catTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: ProductCategoryViewProtocol {
    func loadCategory() {
        setupTableView()
        catTableView.reloadData()
        setUpSkeleton(show: true)
    }
    
    func showErrorMessage(_ message: String) {
        SCLAlertView().showError(TextResources.errorTitle.rawValue, subTitle: message, closeButtonTitle: TextResources.closeButton.rawValue) // Error
    }
    
    func loadCategories() {
        self.catTableView.reloadData()
        setUpSkeleton(show: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
        presenter?.loadCategoryData(name: searchBar.text ?? "carros")
    }
    
//    Skeleton call
    private func setUpSkeleton(show : Bool){
        catTableView.isSkeletonable = true
        if(show){
            catTableView.showAnimatedGradientSkeleton()
        } else{
            catTableView.hideSkeleton()
        }
    }
}

extension ViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
  }
}

extension ViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
  }
}


