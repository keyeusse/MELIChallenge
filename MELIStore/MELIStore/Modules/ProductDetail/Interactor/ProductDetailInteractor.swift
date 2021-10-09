//
//  ProductDetailInteractor.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

class ProductDetailInteractor: ProductDetailInteractorInputProtocol {

    var presenter: ProductDetailInteractorOutputProtocol?
    private let apiClient = APIClient()
    private var productDescriptionResult: ProductDetailDescription?
    
    func loadProductsData(productId: String) {
        apiClient.productDescriptionDelegate = self
        apiClient.getProductDetailDescription(url: .productDescription, productId: productId)
    }
}

//API Calls for all products
extension ProductDetailInteractor: APIProductDescriptionResponseProtocol {
    func getproductDescription(data: ProductDetailDescription) {
        self.productDescriptionResult = data
        self.presenter?.updateProductData()
    }
    
    func onFailure(_ error: Error) {
    
    }
}
