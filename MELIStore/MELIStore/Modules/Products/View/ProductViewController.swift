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
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBAction func ActionBack(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - VIPER IMPLEMENTATION
    var presenter: ProductsPresenterProtocol?
    var animationSubView: AnimationView!
    var categoryId: String?
    var shouldAnimateCell : Bool = true
    
//    Var searchBar
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
      return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = TextResources.products.rawValue
        
        ProductsRouter.createProductsModule(for: self, and: "")
        presenter?.loadProdutsData(categoryId: categoryId ?? "")
        
        setupTableView()
        setSearchBar()
        spinner.startAnimating()
    }
    
    // MARK: - SearchBar implementation
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
        presenter?.loadSearchProductData(name: searchBar.text ?? "carros")
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
    
    // MARK: - SearchBar implementation
    private func setupTableView() {
        self.productsTableView.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.idCell)
        self.productsTableView.dataSource = self
        self.productsTableView.rowHeight = UITableView.automaticDimension
        self.productsTableView.delegate = self
        self.productsTableView.reloadData()
    }
    
    // MARK: - TableView settings
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isFiltering {
            return presenter?.getNumberOfItemsAt(section) ?? 3
        } else {
            return presenter?.getNumberSearchedOfItemsAt(section) ?? 3
        }
    }
    
    private func getItemAt(_ indexPath: IndexPath) -> Products? {
        if isFiltering {
            return presenter?.getProductSearchData()
        } else {
            return presenter?.getItemAtProducts()
        }
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

// MARK: - Delegate for apiCalls
extension ProductViewController: ProductsViewProtocol {
    
    func loadProductList() {
        self.productsTableView.reloadData()
    }
    
    func loadSearchedProductList() {
        self.productsTableView.reloadData()
    }
    
    func showErrorMessage(_ message: String) {
        SCLAlertView().showError(TextResources.errorTitle.rawValue, subTitle: message, closeButtonTitle: TextResources.closeButton.rawValue) // Error
    }
    
    func showNoInternetErrorMessage(_ message: String) {
        SCLAlertView().showInfo(TextResources.errorTitle.rawValue, subTitle: message, closeButtonTitle: TextResources.closeButton.rawValue) // Error
    }
}

// MARK: - Delegate for searchBar
extension ProductViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
  }
}

extension ProductViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
  }
}

