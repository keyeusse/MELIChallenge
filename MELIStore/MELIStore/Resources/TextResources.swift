//
//  TextResources.swift
//  MELIStore
//
//  Created by Meli on 10/9/21.
//

import Foundation

//Resources text for all app
public enum TextResources: String {
    case searchProducts = "Buscar productos"
    case errorTitle = "Error"
    case errorDetail = "Se ha presentado un error, intenta más tarde"
    case closeButton = "Cerrar"
    case noImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Imagen_no_disponible.svg/1024px-Imagen_no_disponible.svg.png"
    case freeShipping = "Envío gratis"
    case whenShipping = "Llega mañana por $10.000"
    case cartTitle = "Producto agregado"
    case cartDescription = "Tu producto fue agregado al carrito de compras"
    case buyTitle = "Compra exitosa"
    case buyDescription = "Tu compra se ejecutó con éxito"
    case ok = "Está bien"
    case perfect = "¡Perfecto!"
    case blackStar = "\u{2605}"
    case whiteStar = "\u{2606}"
}

//Resources text for all app
public enum NumberResources: Float {
    case categorySize = 300
    case productSize = 350
}
