//
//  ProductCategoryProtocol.swift
//  MELIStore
//
//  Created by Meli on 10/7/21.
//

import UIKit

// MARK: - VIPER Protocols
protocol ProductCategoryViewProtocol: AnyObject {
  var presenter: ProductCategoryPresenterProtocol? { get set}
  // PRESENTER -> VIEW
  func loadCategories()
  func loadCategory()
  func showErrorMessage(_ message: String)
}

protocol ProductCategoryPresenterProtocol: AnyObject {
  var view: ProductCategoryViewProtocol? { get set }
  var interactor: ProductCategoryInteractorInputProtocol? { get set}
  var router: ProductCategoryRouterProtocol? { get set }
    
  // VIEW -> PRESENTER
  func getItemAt(indexPath: IndexPath) -> CategoryEntity?
  func getItemAtCategory() -> CategoryDetail?
  func getNumberOfItemsAt(_ index: Int) -> Int
  func loadCategoriesData()
  func loadCategoryData(id: String)
    
  // Show Products List Views
    func showProductListView(for categoryId: String, from view: UIViewController)
}

protocol ProductCategoryInteractorInputProtocol: AnyObject {
  var presenter: ProductCategoryInteractorOutputProtocol? { get set}

  // PRESENTER -> INTERACTOR
  func loadCategoriesData()
  func loadCategoryData(id: String)
  func getNumberOfItemsAt(_ index: Int) -> Int
  func getItemAt(_ indexPath: IndexPath) -> CategoryEntity?
  func getItemCategoryAt() -> CategoryDetail?
    
}

protocol ProductCategoryInteractorOutputProtocol: AnyObject {
  // INTERACTOR -> PRESENTER
  func updateData()
  func updateCategoryData()
  func receivedError(_ error: Error)
}

protocol ProductCategoryRouterProtocol: AnyObject {
  // PRESENTER -> ROUTER
  func presentProductsView(for categoryId: String, from view: UIViewController)
}

/*
// MARK: - UITABLEVIEWCELL Protocols
protocol categoriesTableViewCellDelegate: AnyObject {
  func showProducts(of products: Products)
}

// MARK: - CELL PROTOCOL Definition
protocol UITableViewCellReusableView {
  static func nib() -> UINib
  static func reuseIdentifier() -> String
}
extension UITableViewCellReusableView where Self: UITableViewCell {
  static func nib() -> UINib {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  static func reuseIdentifier() -> String {
    return String(describing: self)
  }
}*/
