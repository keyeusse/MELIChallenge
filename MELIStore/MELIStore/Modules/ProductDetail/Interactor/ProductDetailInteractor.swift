//
//  ProductDetailInteractor.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

//VIPER INTERACTOR
class ProductDetailInteractor: ProductDetailInteractorInputProtocol {
    
    var presenter: ProductDetailInteractorOutputProtocol?
    private let apiClient = APIClient()
    private var productDescriptionResult: ProductDetailDescription?
    
    func loadDescriptionData(categoryId: String) {
        apiClient.productDescriptionDelegate = self
        apiClient.getProductDetailDescription(url: .productDescription, productId: categoryId)
    }
    
    func getNumberOfItemsAt(_ index: Int) -> Int {
        return 0
    }
    
    func getProductDescription() -> ProductDetailDescription? {
        productDescriptionResult
    }
    
}

//API Calls for all products
extension ProductDetailInteractor: APIProductDescriptionResponseProtocol {
    
    func getproductDescription(data: ProductDetailDescription) {
        self.productDescriptionResult = data
        self.presenter?.updateDescriptionData()
    }
    
    func onFailure(_ error: Error) {
    }
    
    func onIntenetFailure(_ error: String) {
        
    }
}
