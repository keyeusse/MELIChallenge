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
    
    var categories = [CategoryDetail]()
    var categoryDetail = CategoryDetail()
    private let apiClient = APIClient()
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCategories: [CategoryDetail] = []
    
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
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = TextResources.searchProducts.rawValue
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.searchBar.backgroundColor = Colors().White
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
        return CGFloat(NumberResources.categorySize.rawValue)
    }
    
    private func getItemAt(_ indexPath: IndexPath) -> CategoryEntity? {
        setUpSkeleton(show : false)
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
    }
    
    func showErrorMessage(_ message: String) {
        SCLAlertView().showError(TextResources.errorTitle.rawValue, subTitle: TextResources.errorDetail.rawValue, closeButtonTitle: TextResources.closeButton.rawValue) // Error
    }
    
    func loadCategories() {
        self.catTableView.reloadData()
        setUpSkeleton(show: true)
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
//    let searchBar = searchController.searchBar
//    let category = Candy.Category(rawValue:
//      searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
//    filterContentForSearchText(searchBar.text!, category: category)
  }
}

extension ViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//    let category = Candy.Category(rawValue:
//      searchBar.scopeButtonTitles![selectedScope])
//    filterContentForSearchText(searchBar.text!, category: category)
  }
}


