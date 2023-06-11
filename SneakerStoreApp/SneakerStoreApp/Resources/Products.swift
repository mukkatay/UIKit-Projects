//
//  Products.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 10.06.2023.
//

import UIKit

struct Product: Equatable {
    let name: String
    let description: String
    let price: String
    let imageName: String
    
    // Реализация функции '==' для сравнения продуктов
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
}

struct CartItem {
    let product: Product
    var quantity: Int
}

func createProducts() -> [Product] {
    let sneaker1 = Product(name: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: "$1251", imageName: "Img1")
    let sneaker2 = Product(name: "Off-White", description: "Кроссовки Off-Court 3.0", price: "$551", imageName: "Img2")
    let sneaker3 = Product(name: "Jordan", description: "Кеды с принтом граффити", price: "$1251", imageName: "Img3")
    let sneaker4 = Product(name: "Jordan", description: "Кеды с принтом граффити", price: "$1251", imageName: "Img4")
    let sneaker5 = Product(name: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: "$1251", imageName: "Img6")
    let sneaker6 = Product(name: "Off-White", description: "Кроссовки Off-Court 3.0", price: "$551", imageName: "Img7")
    let sneaker7 = Product(name: "Jordan", description: "Кеды с принтом граффити", price: "$1251", imageName: "Img8")
    let sneaker8 = Product(name: "Jordan", description: "Кеды с принтом граффити", price: "$1251", imageName: "Img9")
    return [sneaker1, sneaker2, sneaker3, sneaker4, sneaker5, sneaker6, sneaker7, sneaker8]
}


