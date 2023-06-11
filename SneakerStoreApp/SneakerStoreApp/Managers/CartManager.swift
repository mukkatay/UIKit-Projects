//
//  CartManager.swift
//  SneakerStoreApp
//
//  Created by Akyl Mukatay  on 10.06.2023.
//

import UIKit

class CartManager {
    static let shared = CartManager()

    private var cartItems: [CartItem] = []

    private init() {}

    func addToCart(_ product: Product) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.product == product }) {
            // Увеличение количества выбранного продукта
            cartItems[existingItemIndex].quantity += 1
        } else {
            // Добавление нового элемента корзины
            let newItem = CartItem(product: product, quantity: 1)
            cartItems.append(newItem)
        }
    }

    func updateQuantity(for product: Product, quantity: Int) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.product == product }) {
            // Обновление количества выбранного продукта
            cartItems[existingItemIndex].quantity = quantity
        }
    }

    func removeItem(_ item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.product == item.product }) {
            // Удаление элемента корзины
            cartItems.remove(at: index)
        }
    }

    func clearCart() {
        // Очистка корзины
        cartItems.removeAll()
    }

    func getCartItems() -> [CartItem] {
        return cartItems
    }
}
